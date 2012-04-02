#!/usr/bin/env ruby

sequences = Array.new

def delete_from_samples(number, samples)
  for i in 0..samples.length
    if (samples[i] == number)
      samples.delete_at(i)
      break
    end
  end
end

def new_sample(first_samples, second_samples, third_samples, fourth_samples)
  one = first_samples.sample
  
  begin
    two = second_samples.sample
  end while (two == one)

  begin
    three = third_samples.sample
  end while ((three == two) || (three == one))

  begin
    four = fourth_samples.sample
  end while ((four == three) || (four == two) || (four == one))

  delete_from_samples(one,first_samples)
  delete_from_samples(two,second_samples)
  delete_from_samples(three,third_samples)
  delete_from_samples(four,fourth_samples)
  
  sample = "#{one}#{two}#{three}#{four}"
end

def calcuate_frequencies(sequences)
  freq_array = Array.new(4) {|i|Array.new(10){|i| 0}}
  sequences.each do |seq|
    array = seq.chars.to_a
    for position in 0..array.length-1
      freq_array[position][array[position].to_i] += 1
    end 
  end
  freq_array
end

first_position_samples = (0..9).to_a
second_position_samples = (0..9).to_a
third_position_samples =  (0..9).to_a
fourth_position_samples =  (0..9).to_a

0.upto(first_position_samples.length-1) do
  sample = new_sample(first_position_samples, second_position_samples, third_position_samples, fourth_position_samples)
  unless (sequences.include?(sample))
      sequences << sample
      puts "Sample: #{sample}. Total sequences: #{sequences.length}"
  end
end

unless sequences.uniq!
  puts "All unique sequences!"
end

freqs = calcuate_frequencies(sequences)

puts "Frequency 1 @ pos 1: #{freqs[0][0]}"
puts "Frequency 2 @ pos 1: #{freqs[0][1]}"
puts "Frequency 3 @ pos 1: #{freqs[0][2]}"

puts ("Frequencies: #{freqs.inspect}")
puts "Sequences: #{sequences.inspect}"
puts "Number of Sequences: #{sequences.length}"

