#!/usr/bin/env ruby
require 'distribution'

def print_ext_addr(addr)
  print_data [2, 0, 0, 4, (addr >> 8) & 0xff, addr & 0xff]
end

def print_data(data)
  hex = data.map {|d| "%02X" % d}.join
  printf(":%s%02X\n", hex, -data.reduce(&:+) & 0xff)
end

def print_binary(op, offset, opts = {})
  mask = opts[:high] ? 0x0f : 0xf0
  mask = 0 unless opts[:pass]
  16.times.map do |a|
    16.times.map do |b|
      d = 16.times.map do |c|
        x = (b << 4) + c
        y = a << (opts[:high] ? 4 : 0)
        y = 0x10 if (op == '/' && a == 0) # reassign divide-by-zero
        ((op ? x.send(op, y) : y) & 0xff) | (x & mask)
      end
      print_data([d.size, offset + a, b << 4, 0] + d)
    end
  end
end

def print_unary(offset, r)
  0.step(0xF0, 0x10).map do |a|
    print_data([0x10, offset, a, 0] + r[a..a+0xF])
  end
end

# ALU function: AF (arithmetic flags)
# ADD: XXXXYYYY = BBBBAAAA + HHHHLLLL
# AF: A = XXXXYYYY, HL = HHHHLLLL (BBBBAAAA = XXXXYYYY - HHHHLLLL)
# L) XXXXHZPL = XXXXYYYY $ LLLL (flags for AAAA +/- LLLL)
# H) CSZPHVBL = XXXXHZPL $ HHHH
def print_af(offset, opts = {})
  16.times.map do |a|
    16.times.map do |b|
      d = 16.times.map do |c|
        if opts[:high] # a=HHHH, b=XXXX, c=HZPL
          r = c & 9                                   # preserve half carry/borrow
          r |= 0x80 if (b-(c>>3)) < a                 # C - Carry (from bit 7)
          r |= b >> 3                                 # S - Sign of result
          r |= 0x20 if c&4 != 0 && b == 0             # Z - Zero (high if result is 0)
          r |= ((sprintf('%b', b).split('').map(&:to_i).reduce(&:+) + ((c&2)>>1))%2) << 4
          r |= 4 if ((b&7) < (a&7)) ^ (b < a)         # V - Overflow (carry from bit 6 xor carry)
          r |= 2 unless b < a || (c&4 != 0 && a == 0) # B - Borrow (from bit 7 if subtraction)
        else # a=LLLL, b=XXXX, c=YYYY
          r = b << 4                                  # preserve high nibble
          r |= 8 if c < a # YYYY < LLLL               # H - Half carry (carry from bit 3)
          r |= 4 if c == 0                            # (half zero)
          r |= (sprintf('%b', c).split('').map(&:to_i).reduce(&:+)%2) << 1
          r |= 1 unless c < a || a == 0               # L - Low borrow (from bit 3 if subtraction)
        end
        r
      end
      print_data([d.size, offset + a, b << 4, 0] + d)
    end
  end
end

MAX_VOICE = 13
# ALU function: WAV (wavetable sythesizer)
# Gain/Wave - HL, sample index - acc
# L) A = signed 7-bit sample of bandlimited (L even) square (L odd) or sawtooth
# H) A = attenuate from -12db in -1.5dB steps to mute
def print_wav(offset, opts = {})
  normal = Distribution::Normal.rng                     # RNG with mean 0, sigma 1
  h = 16.times.map do |n|                               # fundamental (f), harmonics (2f-16f)
    f = 128.0/(n.to_f+1.0)
    256.times.map {|i| Math.sin(i.to_f * Math::PI/f)}
  end
  16.times.map do |a|
    if opts[:high]
      m = a.zero? ? 0 : 2.0**(a.to_f/4.0-5.75)          # mute,-33..-12 dB
      [*0..255].pack('C*').unpack('c*').map {|i| (i.to_f*m).round&0xFF}
    else
      if a > MAX_VOICE                                  # noise in position 14 and 15
        300.times.map { (normal.call*48).round }.       # normal dist scaled by 48
          select {|i| i.between? -128, 127}.            # select within dynamic range
            first(256).map {|i| i&0xFF}                 # sample 256 and convert to byte
      else
        w = 256.times.map do |i|
          l = h.first(a+1).each_with_index.map do |j,k| # limit band to a+1
            a.even? && k.odd? ? 0 : j[i]/(k+1)          # skip even harmonics on even a
          end.reduce(&:+)                               # sum harmonics
        end
        s = 127.5 / w.max.to_f                          # scale to -128 -> 127
        w.map {|i| (i.to_f*s).floor&0xFF}
      end
    end.each_slice(16).each_with_index {|d, b| print_data [d.size, offset + a, b << 4, 0] + d}
  end
end

ML2SYNC_PG = [3,8,1,4,7,9,2,4,7,9,2,2,4,7,9,0].freeze
ML2LEN = [5,5,5,4,4,4,4,4,4,4,4,3,3,3,3,3].freeze
IDLE_PG = 0x00
INST = [
  0x90,1, 0x97,1, 0xA1,1, 0xB3,1, 0xAF,2, 0xB1,2, 0x95,1, 0xC3,1, #0x00X
  0xE3,2, 0xB5,2, 0xA0,1, 0xB4,1, 0xAF,2, 0xB1,2, 0x95,1, 0xC4,1, 
  0x91,1, 0x97,1, 0xA1,1, 0xB3,1, 0xAF,2, 0xB1,2, 0x95,1, 0xC5,2, #0x01X
  0xD3,2, 0xB5,2, 0xA0,1, 0xB4,1, 0xAF,2, 0xB1,2, 0x95,1, 0xC6,2, 
  0xE1,2, 0x97,1, 0x9D,3, 0xB3,1, 0xAF,2, 0xB1,2, 0x95,1, 0xB6,2, #0x02X
  0xE4,1, 0xB5,2, 0x9A,3, 0xB4,1, 0xAF,2, 0xB1,2, 0x95,1, 0xC7,1, 
  0xE2,2, 0x97,1, 0x99,2, 0xB3,1, 0xB0,2, 0xB2,2, 0x96,2, 0xC9,1, #0x03X
  0xE5,1, 0xB5,2, 0x98,2, 0xB4,1, 0xAF,2, 0xB1,2, 0x95,1, 0xC8,1, 
  0x93,1, 0x93,1, 0x93,1, 0x93,1, 0x93,1, 0x93,1, 0x93,1, 0x93,1, #0x04X
  0x93,1, 0x93,1, 0x93,1, 0x93,1, 0x93,1, 0x93,1, 0x93,1, 0x93,1, 
  0x93,1, 0x93,1, 0x93,1, 0x93,1, 0x93,1, 0x93,1, 0x93,1, 0x93,1, #0x05X
  0x93,1, 0x93,1, 0x93,1, 0x93,1, 0x93,1, 0x93,1, 0x93,1, 0x93,1, 
  0x93,1, 0x93,1, 0x93,1, 0x93,1, 0x93,1, 0x93,1, 0x93,1, 0x93,1, #0x06X
  0x93,1, 0x93,1, 0x93,1, 0x93,1, 0x93,1, 0x93,1, 0x93,1, 0x93,1, 
  0x94,1, 0x94,1, 0x94,1, 0x94,1, 0x94,1, 0x94,1, 0x92,1, 0x94,1, #0x07X
  0x93,1, 0x93,1, 0x93,1, 0x93,1, 0x93,1, 0x93,1, 0x93,1, 0x93,1, 
  0xA3,1, 0xA3,1, 0xA3,1, 0xA3,1, 0xA3,1, 0xA3,1, 0xA4,1, 0xA3,1, #0x08X
  0xA6,1, 0xA6,1, 0xA6,1, 0xA6,1, 0xA6,1, 0xA6,1, 0xA7,2, 0xA6,2, 
  0xA9,1, 0xA9,1, 0xA9,1, 0xA9,1, 0xA9,1, 0xA9,1, 0xAA,1, 0xA9,1, #0x09X
  0xAC,2, 0xAC,2, 0xAC,2, 0xAC,2, 0xAC,2, 0xAC,2, 0xAD,2, 0xAC,2, 
  0xB7,1, 0xB7,1, 0xB7,1, 0xB7,1, 0xB7,1, 0xB7,1, 0xB8,1, 0xB7,1, #0x0AX
  0xBD,1, 0xBD,1, 0xBD,1, 0xBD,1, 0xBD,1, 0xBD,1, 0xBE,1, 0xBD,1, 
  0xBA,1, 0xBA,1, 0xBA,1, 0xBA,1, 0xBA,1, 0xBA,1, 0xBB,1, 0xBA,1, #0x0BX
  0xC0,1, 0xC0,1, 0xC0,1, 0xC0,1, 0xC0,1, 0xC0,1, 0xC1,1, 0xC0,1, 
  0xD0,2, 0xD5,2, 0xCB,1, 0xCA,2, 0xCD,2, 0xD7,2, 0xA5,2, 0xD2,1, #0x0CX
  0xD1,2, 0xD0,2, 0xCB,1, 0xCC,1, 0xCE,2, 0xCD,2, 0xA8,2, 0xD2,1, 
  0xD0,2, 0xD5,2, 0xCB,1, 0xDD,2, 0xCD,2, 0xD7,2, 0xAB,2, 0xD2,1, #0x0DX
  0xD1,2, 0xCF,2, 0xCB,1, 0xDC,2, 0xCE,2, 0x01,1, 0xAE,2, 0xD2,1, 
  0xD0,2, 0xD5,2, 0xCB,1, 0xDA,2, 0xCD,2, 0xD7,2, 0xB9,2, 0xD2,1, #0x0EX
  0xD1,2, 0xD4,1, 0xCB,1, 0xA2,2, 0xCE,2, 0x02,2, 0xBF,2, 0xD2,1, 
  0xD0,2, 0xD6,2, 0xCB,1, 0xE0,1, 0xCD,2, 0xD8,2, 0xBC,2, 0xD2,1, #0x0FX
  0xD1,2, 0xDB,1, 0xCB,1, 0xDF,1, 0xCE,2, 0x03,1, 0xC2,2, 0xD2,1, 
  0x70,2, 0x70,2,
].freeze # 8080 inst page decoding, cycle count
# ALU function: VMP (Virtual Machine Page)
# Instruction - HHHHLLLL, virtual machine state (VMS) - MMMMECCC
# L) 0ECCLLLL = MMMMECCC $ LLLL - vcpu: E, CC=remaining cycles [0,1,2,3+], LLLL
# H) PPPPPPPP = 0ECCLLLL $ HHHH - page if in line
# L) 0Z00MMMM = MMMMECCC $ LLLL - sync: Z=(L==0)?0:1, CC=0, MMMM
# H) PPPPPPPP = 0Z00MMMM $ HHHH - page if end of line - hsync
def print_vmp(offset, opts = {})
  16.times.map do |a|
    16.times.map do |b|
      if opts[:high] # a=HHHH, b=0ECC,0Z00
        d = 16.times.map do |c|
          if b&3 == 0 # end of line - sync page - c=MMMM
            pg = (a|b).zero? ? 0xF0 : 0xE6
            pg + ML2SYNC_PG[c]
          else # fetch/exec inst page - c=LLLL
            i = (a<<4) | c
            i += (b<<6) & 0x100
            pg = i<<1
            cc = pg+1
            INST[pg].nil? || b&3<INST[cc] ? IDLE_PG : INST[pg]
          end
        end
      else # a=LLLL, b=MMMM
        d = 16.times.map do |c| # c=ECCC
          cc = (ML2LEN[b] - (c&7)).clamp(0, 3)
          if cc.zero?
            e = b
            e |= 0x40 unless a.zero?
            e
          else
            e = a
            e |= 0x40 unless (c&8).zero?
            e | cc<<4
          end
        end
      end
      print_data([d.size, offset + a, b << 4, 0] + d)
    end
  end
end

# Verical timing: [active,back,sync,front]
# Process cycles: [active,sync,porch]
# Mode-line number(s): [(start..end)],[...]]
# Process cycles per pattern: [mode0, mode1,...]
# Modulo(s) per mode: [[mode0,...],[mode1,...]
# Pattern index per mode: [[mode0,...],[mode1,...]
VID = [[[480,10,2,33], [160,4,11], [(0..2)], [4,2,4,8],
        [[2], [3], [4], [8]], [[0], [1], [2], [3]]],                    #VGA@60
       [[480,1,3,28], [120,1,7], [(3..6),(7..10)], [1,3,5,4],
        [[2,4], [3,6], [5,10], [8,16]], [[0,2], [1,2], [2,4], [3,5]]],  #VGA@75
       [[600,1,4,35], [144,8,8], [(3..6),(7..10)], [1,3,5,4],
        [[2,4], [3,6], [5,10], [8,16]],  [[0,2], [1,2], [2,4], [3,5]]], #SVGA@60
       [[768,3,6,23], [150,6,4], [(11..15)], [4,4,8,16],
        [[4], [5], [8], [16]], [[0], [1], [2], [5]]]].freeze            #XGA@60
PAT = [[10,11,11,10], [10,11], [12,13,14,15],                           # mod2/4/5, mod3, mod4/5/6/8
       [0,1,2,3,4,5,6,7], [0,1,2,3,4,5,6,7,8,9],                        # mod8, mod10
       [16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]].freeze        # mod16
# ALU function: VID (Video timings)
def print_vid(offset)
  rom = Array.new(16) { Array.new(0x100, 0xFF) }
  a = 0
  x = [176, 176, 176, 161]
  y = [199, 199, 207, 199]
  VID.each_with_index do |v, z|
    v[4].each_with_index do |c, i| # timing columns
      m = 0
      c.each_with_index do |d, j| # timing columns
        pat = PAT[v[5][i][j]]
        m = 0
        n = 0
        u = case
        when z==2 && i==3 && j==1
          [576,13,4,47]
        when z==3 && i==1
          [750,12,6,32]
        else
          v[0]
        end.map {|t| n+=t}
        p = 0
        t = 0
        v[1].each_with_index do |b, k| # process blocks
          b.times do
            q = p%v[3][i]
            w = case k
	    when 0
              x[z]+q
            when 1
              m+=1
              y[z]+m
            when 2
              0xFF
            end
            rom[a][p] = w if rom[a][p] == 0xFF
            exit if rom[a][p] != w # conflict!
            v[2][j].each do |r|
              s = (t>=u[1] && t<u[2]) ? 0 : 0x20 # vsync active low
              if t<u[0]
                s |= 0x40 # venable
                s |= pat[t%pat.size] # set glyph line
                s |= 0x80 if (t%d)==0 # inc V at start of glyph
              else
                s |= 9 # blank line
              end
              rom[r][w] = s if rom[r][w] == 0xFF
              exit if rom[r][w] != s # conflict!
              t += 1
            end
            p += 1
          end
        end
        rom[a][p] = 0
      end
      x[z] += v[3][i]
      y[z] += m
      a += 1
    end
  end
  # dump ROM table
  rom.each_with_index { |a, j|
    a.each_slice(16).each_with_index { |b, i|
      print_data [b.size, offset + j, i << 4, 0] + b
    }
  }
end

# ALU function: COM (Comms State Machine)
# Next comms state = E [ps2clk,ps2rx,cts,rx], comms state SSSDPDPS
# Serial Data: (RX0,RX-1,RX-2)
# Serial State: RX0 & RX-1 & RX-2
# @start: PS=ps2clk
# PS/2 Data: (PD1=PD0, PD0=ps2rx) if (PS0==1 && ps2clk==0)
# PS/2 State: PS=(PS+1)%4 if PS0!=ps2clk
# @end: #bits = {1:0,2:1,3:1,0:2}[PS]
def print_com(offset)
  16.times.map do |a| # E
    ps2clk = a>>3
    ps2rx = (a>>2)&1
    rx = a&1
    16.times.map do |b| # serial
      sd = sprintf("%04b",b)
      sd = [rx,sd[3],sd[1],"0000"].join.to_i(2)             # 7-digit binary to nibble
      sd = 0xF0 if sd==0x70
      d = 16.times.map do |c| # ps/2
        pd = c>>2
        ps = c&3
        sd + [
          ((ps&1)==1 && ps2clk==0) ? ((pd*2)&3)+ps2rx : pd,
          (ps&1)==ps2clk ? ps : (ps+1)%4
        ].join.to_i(4)                                      # 2-digit quaternary to nibble
      end
      print_data([d.size, offset + a, b << 4, 0] + d)
    end
  end
end

NEXT_LINE = [0x10, 0x20, 0x00,
       0x40, 0x50, 0x60, 0x30,
       0x80, 0x90, 0xA0, 0x70,
 0xC0, 0xD0, 0xE0, 0xF0, 0xB0].freeze
# Increment line count in HAL state machine
def inc_line
  256.times.map {|i| NEXT_LINE[i>>4] | (i&8)}
end

NEXT_PROC = [0x21, 0x21, 0x21,
       0x61, 0x61, 0x61, 0x61,
       0xA1, 0xA1, 0xA1, 0xA1,
 0xF1, 0xF1, 0xF1, 0xF1, 0xF1].freeze
# Increment line count in HAL state machine
def inc_proc
  256.times.map {|i| NEXT_PROC[i>>4] | (i&8)}
end

# fork on HAL feature - audio, rx, tx, tx/kbd context switch
FORK_HAL = [
  [0x20, 0x30, 0x40, 0x70] * 16,                        # 0-3:audio
  [0x20, 0x38, 0x48, 0x38, 0x60, 0x60, 0x68, 0x68,      # 4:rx
   0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
   0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,      # 5:rx
   0xA8, 0xA8, 0x38, 0x38, 0x38, 0x38, 0x38, 0x38,
   0x28, 0x38, 0x48, 0x38, 0x60, 0x60, 0x68, 0x68,      # 6:rx
   0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
   0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,      # 7:rx
   0xA8, 0xA8, 0x38, 0x38, 0x38, 0x38, 0x38, 0x38],
  [0x20, 0xE0, 0x38, 0xE0, 0x70, 0x70, 0x70, 0x70,      # 8:tx
   0x70, 0x70, 0x70, 0x70, 0x70, 0x70, 0x70, 0x70,
   0x70, 0x70, 0x70, 0x70, 0xB0, 0xB0, 0xB0, 0xB0,      # 9:tx
   0xF0, 0xF0, 0xF0, 0xF0, 0x20, 0x20, 0x20, 0x20,
   0x38, 0x38, 0x38, 0x38, 0x70, 0x70, 0x70, 0x70,      # A:tx
   0x70, 0x70, 0x70, 0x70, 0x70, 0x70, 0x70, 0x70,
   0x70, 0x70, 0x70, 0x70, 0xB0, 0xB0, 0xB0, 0xB0,      # B:tx
   0xF0, 0xF0, 0xF0, 0xF0, 0x20, 0x20, 0x20, 0x20],
  [0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0x28,      # C,E:kbd
   0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0x28,
   0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0x28, 0x28,      # D,F:kbd
   0x28, 0x28, 0x28, 0x28, 0x30, 0x30, 0x30, 0x30] * 2
].flatten.freeze

# fork on keyboard scan and decode
FORK_KBD = [
# |-> none  <-|->  alt  <-|-> ctrl  <-|->ctrl-alt<-|    000EBCAS
  [0x68, 0x70, 0x88, 0x88, 0x80, 0x80, 0x80, 0x80,      # make
   0xC0, 0xC0, 0xC0, 0xC0, 0xC0, 0xC0, 0xC0, 0xC0,      # break
   0x78, 0x78, 0x78, 0x78, 0x78, 0x78, 0x98, 0x98,      # ext-make
   0xC0, 0xC0, 0xC0, 0xC0, 0xC0, 0xC0, 0xC0, 0xC0] * 4, # ext-break
  [0x08, 0x08, 0x08, 0x08, 0x60, 0x60, 0x60, 0x60,
   0x60, 0x60, 0x60, 0x60, 0x60, 0x60, 0x88, 0x88,
   0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88,
   0x88, 0x88, 0xB0, 0xB0, 0x08, 0x08, 0x08, 0x08] * 4  # tx:scan
].flatten.freeze

SCAN_LO = [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, "\t", '`', nil, nil, nil, nil, nil, nil, 'q', '1', nil, nil, nil, 'z', 's', 'a', 'w', '2', nil, nil, 'c', 'x', 'd', 'e', '4', '3', nil, nil, ' ', 'v', 'f', 't', 'r', '5', nil, nil, 'n', 'b', 'h', 'g', 'y', '6', nil, nil, nil, 'm', 'j', 'u', '7', '8', nil, nil, ',', 'k', 'i', 'o', '0', '9', nil, nil, '.', '/', 'l', ';', 'p', '-', nil, nil, nil, '\'', nil, '[', '=', nil, nil, nil, nil, "\n", ']', nil, '\\', nil, nil, nil, nil, nil, nil, nil, nil, "\b", nil, nil, '1', nil, '4', '7', nil, nil, nil, '0', '.', '2', '5', '6', '8', "\e", nil, nil, '+', '3', '-', '*', '9', nil, nil].freeze

SCAN_UP = [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, "\t", '~', nil, nil, nil, nil, nil, nil, 'Q', '!', nil, nil, nil, 'Z', 'S', 'A', 'W', '@', nil, nil, 'C', 'X', 'D', 'E', '$', '#', nil, nil, ' ', 'V', 'F', 'T', 'R', '%', nil, nil, 'N', 'B', 'H', 'G', 'Y', '^', nil, nil, nil, 'M', 'J', 'U', '&', '*', nil, nil, '<', 'K', 'I', 'O', ')', '(', nil, nil, '>', '?', 'L', ':', 'P', '_', nil, nil, nil, '"', nil, '{', '+', nil, nil, nil, nil, "\n", '}', nil, '|', nil, nil, nil, nil, nil, nil, nil, nil, "\b", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, "\e", nil, nil, nil, nil, nil, nil, nil, nil, nil].freeze

SCAN_EX = [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, "\t", '`', nil, nil, nil, nil, nil, nil, 'q', '1', nil, nil, nil, 'z', 's', 'a', 'w', '2', nil, nil, 'c', 'x', 'd', 'e', '4', '3', nil, nil, ' ', 'v', 'f', 't', 'r', '5', nil, nil, 'n', 'b', 'h', 'g', 'y', '6', nil, nil, nil, 'm', 'j', 'u', '7', '8', nil, nil, ',', 'k', 'i', 'o', '0', '9', nil, nil, '.', '/', 'l', ';', 'p', '-', nil, nil, nil, '\'', nil, '[', '=', nil, nil, nil, nil, "\n", ']', nil, '\\', nil, nil, nil, nil, nil, nil, nil, nil, "\b", nil, nil, '1', nil, '4', '7', nil, nil, nil, '0', '.', '2', '5', '6', '8', "\e", nil, nil, '+', '3', '-', '*', '9', nil, nil].freeze

# fork on masked interupt
def fork_intr
  256.times.map do |i|
    case 
    when i & 0x04 != 0 # rst 7.5
      0xA0
    when i & 0x02 != 0 # rst 6.5
      0x80
    when i & 0x01 != 0 # rst 5.5
      0x60
    when i & 0x08 != 0 # intr
      0x40
    else               # fetch
      0x20
    end
  end
end

# Rx state to multiplier/mode
#curr,prev
# 534 201
# RAT,PTR
# ?0?,?0?-2-double-4
# ?0?,?10-4-next-6
# ?0?,?11-8-next-6
# ?10    -2-next-6
# ?11    -4-skip-2
# A=mult,mode
def rxstate_mulmode
  256.times.map do |i|
    if i&0x20==0
      if i&2==0
        0x24 #double
      else
        if i&1==0
          0x46 #next
        else
          0x86 #next
        end
      end
    else
      if i&0x10==0
        0x26 #next
      else
        0x42 #skip
      end
    end
  end
end

# Swap carry with borrow flags (CSZPHVBL->BSZPLVCH)
def swap_carry
  256.times.map do |i|
    r = i & 0x74
    r |= (i&2)<<6
    r |= (i&1)<<3
    r |= (i&0x80)>>6
    r |= (i&8)>>3
    r
  end
end

# Decimal adjust carry (set carry if nibbles > 9)
def da_carry
  256.times.map do |i|
    r = i
    r |= 8 if i&0xF > 9
    r |= 0x80 if i&0xF0 > 0x90
    r
  end
end

# Flags -> PSW (CSZPHVBL->SZKA0PVC)
def flags_psw
  256.times.map do |i|
   r = 0
   r |= 0x80 unless i&0x40 == 0
   r |= 0x40 unless i&0x20 == 0
   r |= 0x20 if (i&0x40 == 0) ^ (i&0x04 == 0) # undocumented 8085
   r |= 0x10 unless i&8 == 0
   r |= 4 unless i&0x10 == 0
   r |= 2 unless i&0x04 == 0 # undocumented 8085
   r |= 1 unless i&0x80 == 0
   r
  end
end

# PSW -> Flags (SZKA0PVC->CSZPHV00)
def psw_flags
  256.times.map do |i|
   r = 0
   r |= 0x80 unless i&1 == 0
   r |= 0x40 unless i&0x80 == 0
   r |= 0x20 unless i&0x40 == 0
   r |= 0x10 unless i&4 == 0
   r |= 8 unless i&0x10 == 0
   r |= 4 unless i&0x02 == 0 # undocumented 8085
   r
  end
end

# MIDI to Note H/L (20vmc/block, 18vmc/block)
def note(opts = {})
  [412500.0/43.0, 1375000.0/131.0].map do |t|
    128.times.map do |m|
      f = 440.0 * 2.0**((m-69).to_f/12.0)
      n = (65536.0 * f / t).round
      n >>= 8 if opts[:high]
      f>t/2 ? 0 : n&0xFF
    end
  end.flatten
end

# MIDI to max WAVE bandlimit (20vmc/block, 18vmc/block)
def wave
  [412500.0/43.0, 1375000.0/131.0].map do |t|
    l = MAX_VOICE.times.map {|i| t/((i+2)*2).to_f}
    128.times.map do |n|
      f = 440.0 * 2.0**((n-69).to_f/12.0)
      l.map {|i| i>f ? 1:0}.reduce(&:+)
    end
  end.flatten
end

# keyboard mode bit mask
def kmode_mask
  256.times.map do |code|
    case code
    when 0x12 # Shift_L
      0b00001
    when 0x59 # Shift_R
      0b00001
    when 0x11 # Alt_L
      0b00010
    when 0x14 # Ctrl_L
      0b00100
    else
      0x80
    end
  end
end

def ctrl_alt_page
  128.times.map do |code|
    case code
    when 0x71
      0x82
    else
      0
    end
  end
end

# start of ALU high
print_ext_addr 0x0002
# 0x00020000-0x00020FFF: MV high nibble
print_binary nil, 0x00, high: true, pass: true
# 0x00021000-0x00021FFF: ADD high nibble
print_binary '+', 0x10,  high: true
# 0x00022000-0x00022FFF: AF high nibble
print_af 0x20,  high: true
# 0x00023000-0x00023FFF: AND high nibble
print_binary '&', 0x30,  high: true, pass: true
# 0x00024000-0x00024FFF: OR high nibble
print_binary '|', 0x40,  high: true, pass: true
# 0x00025000-0x00025FFF: XOR high nibble
print_binary '^', 0x50,  high: true, pass: true
# 0x00026000-0x00026FFF: WAV high nibble
print_wav 0x60, high: true
# 0x00027000-0x00027FFF: VMP high nibble
print_vmp 0x70, high: true

# start of ALU low
print_ext_addr 0x0003
# 0x00030000-0x00030FFF: MV low nibble
print_binary nil, 0x00, pass: true
# 0x00031000-0x00031FFF: ADD low nibble
print_binary '+', 0x10
# 0x00032000-0x00032FFF: AF low nibble
print_af 0x20
# 0x00033000-0x00033FFF: AND low nibble
print_binary '&', 0x30, pass: true
# 0x00034000-0x00034FFF: OR low nibble
print_binary '|', 0x40, pass: true
# 0x00035000-0x00035FFF: XOR low nibble
print_binary '^', 0x50, pass: true
# 0x00036000-0x00036FFF: WAV low nibble
print_wav 0x60
# 0x00037000-0x00037FFF: VMP low nibble
print_vmp 0x70

# 0x00038000-0x00038FFF: MUL low nibble only
print_binary '*', 0x80
# 0x00039000-0x00039FFF: DIV low nibble only
print_binary '/', 0x90
# 0x0003A000-0x0003AFFF: COM low nibble only
print_com 0xA0
# 0x0003B000-0x0003BFFF: VID low nibble only
print_vid 0xB0

# 0x0003C000-0x0003CFFF: FNC low nibble only
# $SCAN0: default/shift
print_unary(0xC0, (SCAN_LO+SCAN_UP).map {|c| c ? c.ord : 0})
# $SCAN1: extended/control
print_unary(0xC1, SCAN_EX.map {|c| c ? c.ord : 0}+Array.new(0x80, 0))
# $SCAN2: alt/ext-ctrl-alt
print_unary(0xC2, Array.new(0x80, 0)+ctrl_alt_page)
# $SC2MASK: scan code->keyboard mode bit mask
print_unary(0xC3, kmode_mask)

# 0x0003D000-0x0003DFFF: FND low nibble only - 8080 vCPU related
# FORKI: fork on interrupt
print_unary(0xD0, fork_intr)
# $FORK1: 0->0x80,else->0xC0
print_unary(0xD1, [0x80] + Array.new(0xFF, 0xC0))
# $FORK2: 0xFF->0x40,0->0x80,else->0xC0
print_unary(0xD2, [0x80] + Array.new(0xFE, 0xC0) + [0x40])
# $FORK3: 0xFE->0x20,0xFF->0x38,0->0x90,else->0xC8
print_unary(0xD3, [0x90] + Array.new(0xFD, 0xC8) + [0x20, 0x38])
# $MAPREGH: map instruction to zpage addr of destination register, or high source register pair
REG8=[0xF2, 0xF3, 0xF4, 0xF5, 0xF6, 0xF7, 0, 0xF0].freeze
REG16H=[0xF2, 0xF4, 0xF6, 0xF8].freeze
print_unary(0xD4, 256.times.map { |i|
  (i&0xC4).zero? || (i>0xC0) ? REG16H[(i&0x30)>>4] : REG8[(i&0x38)>>3]
})
# $MAPREGL: map instruction to zpage addr of source register, or low source register pair
REG16L=[0xF3, 0xF5, 0xF7, 0xF9].freeze
print_unary(0xD5, 256.times.map { |i|
  (i&0xC4).zero? || (i>0xC0) ? REG16L[(i&0x30)>>4] : REG8[i&7]
})
# $F2PSW: flags->PSW
print_unary(0xD6, flags_psw)
# $PSW2F: PSW->flags
print_unary(0xD7, psw_flags)
# $SWCARRY: swap carry with borrow flags (CNZPHOBL->BNZPLOCH)
print_unary(0xD8, swap_carry)
# $DACARRY: set carry if nibbles > 9
print_unary(0xD9, da_carry)
# $CON2MUL: condition code to flag multiplier (ZCPS->CNZPHOBL)
CON=[0x40, 0x10, 0x80, 0x20].freeze
UNC=[0xC3, 0xC9, 0xCD].freeze # unconditional instructions
print_unary(0xDA, 256.times.map {|i| UNC.include?(i) ? 0 : CON[(i&0x30)>>4]})
# $RSTVEC


# 0x0003E000-0x0003EFFF: FNE low nibble only - HAL related
# $XGA?: mode-line: 0-10->-1,else->0
print_unary(0xE0, [0xFF]*0xB0 + [0]*0x50)
# $INCCYC: inc, clear ext bit
print_unary(0xE1, 256.times.map{|i| (i&0xF0) + (i+1)%8})
# $FORKJ: fork on HAL features (audio/rx/tx)
print_unary(0xE2, FORK_HAL)
# $FORKK: fork on keyboard
print_unary(0xE3, FORK_KBD)
# $ML2ADJ: mode-line to frame count: 0-2->0xE0,else->0xF0
print_unary(0xE4, [0xE0]*48 + [0xF0]*208)
# $MASK2MODE: IMASK enable bit (3) 0->-1, 1->0
print_unary(0xE5, 256.times.map{|i| i&8==0 ? 0xFF : 0})
# $RXS2M: Rx serial to multiplier/mode
print_unary(0xE6, rxstate_mulmode)
# $TKTOG: tx/kbd mode toggle 10xxxxQx->11Q00010, 11QxxxxK->100110QK
print_unary(0xE7, 256.times.map{|i| i&0x40==0 ? ((i&2)<<4)|0xC2 : ((i&0x20)>>4)|0x98|(i&1)})
# $KS01?: &3==0||1 ? 0:-1
print_unary(0xE8, 256.times.map{|i| i&3 <= 1 ? 0 : 0xFF})
# $KDATA: &C<<2
print_unary(0xE9, 256.times.map{|i| (i&0xC) << 2})
# $ADSRPG: FRAME->ADSR Page: FC->3,FD->2,FE->1,FF->0
print_unary(0xEA, [0xED,0xEC,0xEB,0xEA]*64)
# $SUS2LEV: sustain to level
print_unary(0xEB, 256.times.map{|i| ((-1*i)&0xF)<<4})
# SQRWAV: square wave number bandlimit
print_unary(0xEC, wave.map {|i| i&0xFE})
# SAWWAV: sawtooth wave number bandlimit
print_unary(0xED, wave.map {|i| i&1==0 && i>0?i-1:i})
# $FREQL: low byte of note
print_unary(0xEE, note)
# $FREQH: high byte of note
print_unary(0xEF, note(high:true))

# 0x0003F000-0x0003FFFF: FNF low nibble only - generic/default functions
# $IDEN: A = A
print_unary(0xF0, [*0..0xFF])
# $INC: A = A + 1
print_unary(0xF1, [*1..0xFF] + [0])
# $DEC: A = A - 1
print_unary(0xF2, [0xFF] + [*0..0xFE])
# $INC2: A = A + 2
print_unary(0xF3, [*2..0xFF] + [0,1])
# $1COM: A = -A + 1
print_unary(0xF4, 256.times.map{|i| ((-1*i)-1)&0xFF})
# $2COM: A = -A
print_unary(0xF5, 256.times.map{|i| (-1*i)&0xFF})
# $LSR: >>1
print_unary(0xF6, 256.times.map{|i| i>>1})
# $LSL: <<1
print_unary(0xF7, 256.times.map{|i| (i<<1)&0xFF})
# $OVER?: A = A==0? 0 : -1
print_unary(0xF8, [0] + Array.new(0xFF, 0xFF))
# $UNDER?: A = A==0xFF? -1 : 0
print_unary(0xF9, Array.new(0xFF, 0) + [0xFF])
# $INCLINE: mode_line+1, cycle = 0
print_unary(0xFA, inc_line)
# $INCPROC: reset mode_line, cycle = 1
print_unary(0xFB, inc_proc)
# $NSR: >>1&0x80
print_unary(0xFC, 256.times.map{|i| (i>>1) | 0x80})
# $SWAP: BA = AB
print_unary(0xFD, 256.times.map {|i| ((i>>4) | (i<<4))&0xFF})
# $REVERSE: 76543210 = 01234567
print_unary(0xFE, 256.times.map {|i| sprintf("%08b",i).reverse.to_i(2)})
# AUDIO: 76543210 = 01234567^1
print_unary(0xFF, 256.times.map {|i| sprintf("%08b",i).reverse.to_i(2)^1})
