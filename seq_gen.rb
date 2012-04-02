#!/usr/bin/env ruby

def delete_from_samples(number, samples)
  for i in 0..samples.length
    if (samples[i] == number)
      samples.delete_at(i)
      break
    end
  end
end

def new_sample(first_samples, second_samples, third_samples, fourth_samples)
  one = first_samples.first
  two = nil
  three = nil
  four = nil
  
  second_samples.each do |second|
    unless (second == one)
      two = second
    end
  end
  
  third_samples.each do |third|
    unless (third == two || third == one)
      three = third
    end
  end

  fourth_samples.each do |fourth|
    unless ((fourth == three) || (fourth == two) || (fourth == one))
      four = fourth
    end
  end
   

  delete_from_samples(one,first_samples)
  delete_from_samples(two,second_samples)
  delete_from_samples(three,third_samples)
  delete_from_samples(four,fourth_samples)
  unless (one.nil? || two.nil? || three.nil? or four.nil?)
    sample = "#{one}#{two}#{three}#{four}"
    return sample
  end
  nil
end

def calcuate_frequencies(sequences)
  freq_array = Array.new(4) {|i|Array.new(10){|i| 0}}
  sequences.each do |seq|
    unless (seq.nil?)
      array = seq.chars.to_a
      for position in 0..array.length-1
        freq_array[position][array[position].to_i] += 1
      end
    end
  end
  freq_array
end

def generate_sequence()
  begin
    sequences = Array.new
    first_position_samples = (0..9).to_a.shuffle!
    second_position_samples = (0..9).to_a.shuffle!
    third_position_samples =  (0..9).to_a.shuffle!
    fourth_position_samples =  (0..9).to_a.shuffle!
    
    0.upto(first_position_samples.length) do
      sample = new_sample(first_position_samples, second_position_samples, third_position_samples, fourth_position_samples)
      unless (sequences.include?(sample))
          sequences << sample
          puts "Sample: #{sample}. Total sequences: #{sequences.length}"
      end
    end
    sequences.compact!
  end while (sequences.length<10)
  return sequences
end
  
@sequences = generate_sequence()

unless @sequences.uniq!
  puts "All unique sequences!"
end

freqs = calcuate_frequencies(@sequences)

puts "Frequency 1 @ pos 1: #{freqs[0][0]}"
puts "Frequency 2 @ pos 1: #{freqs[0][1]}"
puts "Frequency 3 @ pos 1: #{freqs[0][2]}"

puts ("Frequencies: #{freqs.inspect}")
puts "Sequences: #{@sequences.inspect}"
puts "Number of Sequences: #{@sequences.length}"

