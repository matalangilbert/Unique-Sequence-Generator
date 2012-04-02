#!/usr/bin/env ruby

test = (0..9).to_a
sequences = test.permutation(4).to_a

freq_in_position = Hash.new(0)

final_sequences = Array.new

sequences.each do |seq|
  insert = true
  seq.each_with_index do |digit,position|
    if (freq_in_position[[position,digit]] >= 7)
      insert = false
    end
  end
  if (insert)
    final_sequences << seq
    seq.each_with_index do |digit,position|
    freq_in_position[[position,digit]] +=1
    end
  end
end

p freq_in_position.inspect
p final_sequences.length
p final_sequences



