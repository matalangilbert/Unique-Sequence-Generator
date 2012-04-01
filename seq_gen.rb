#!/usr/bin/env ruby

class Sequence
  attr_accessor :first
  attr_accessor :second
  attr_accessor :third
  attr_accessor :fourth
  
  def to_s
    "#{@first}#{@second}#{@third}#{@fourth}"
  end   
end

sequences = Array.new
for i in 0..9
  for j in 0..9
    for k in 0..9
      for l in 0..9
        seq = Sequence.new
        seq.first = i
        seq.second = j
        seq.third = k
        seq.fourth = l
        sequences << seq
      end
    end
  end
end

sequences.delete_if do |seq|
  (seq.first == seq.second) || (seq.first == seq.third) || (seq.first == seq.fourth) || (seq.second == seq.third) || (seq.second == seq.fourth) || (seq.third == seq.fourth)
end

first_frequencies = Array.new

for i in 0..9 do
  first_frequencies << 0
end
 
sequences.each do |sequence|
  case sequence.first
  when 0
    first_frequencies[0] += 1
  when 1
    first_frequencies[1] += 1
  when 2
    first_frequencies[2] += 1
  when 3
    first_frequencies[3] += 1
  when 4
    first_frequencies[4] += 1
  when 5
    first_frequencies[5] += 1
  when 6
    first_frequencies[6] += 1
  when 7
    first_frequencies[7] += 1
  when 8
    first_frequencies[8] += 1
  when 9
    first_frequencies[9] += 1
  end
end

sequences.each do |sequence|
    puts "#{sequence}"
end

puts "Number of sequences: #{sequences.length}"

i = 0
first_frequencies.each do |frequency|
  puts "First frequency of #{i}: #{frequency}"
  i += 1
end



