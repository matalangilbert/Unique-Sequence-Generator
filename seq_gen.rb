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

LIMIT=7
def add_sequence(final_sequences,frequencies, sequence)  
  if ((frequencies[[1,sequence.first]]+1)<LIMIT)
    if (frequencies[[2,sequence.second]]<LIMIT)
      if (frequencies[[3,sequence.third]]<LIMIT)
        if (frequencies[[4,sequence.fourth]]<LIMIT)
          frequencies[[1,sequence.first]] += 1
          frequencies[[2,sequence.second]] += 1
          frequencies[[3,sequence.third]] += 1
          frequencies[[4,sequence.fourth]] += 1
          final_sequences << sequence
        end
      end
    end
  end
end
    
iterations = 0

while iterations<1000 do
  final_sequences = Array.new
  final_frequencies = Hash.new(0)
  
  sequences.each do |sequence|
    add_sequence(final_sequences, final_frequencies,sequence)
  end
  
  puts "Number of sequences: #{final_sequences.length}"
  puts "Frequencies: #{final_frequencies.inspect}"
  
  sequences.shuffle!
end



