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

frequencies = Hash.new(0)

sequences.each do |sequence|
  frequencies[[1,sequence.first]] += 1
  frequencies[[2,sequence.second]] += 1
  frequencies[[3,sequence.third]] += 1
  frequencies[[4,sequence.fourth]] += 1
  puts "#{sequence}"
end

puts "Number of sequences: #{sequences.length}"

puts "Frequencies: #{frequencies.inspect}"



