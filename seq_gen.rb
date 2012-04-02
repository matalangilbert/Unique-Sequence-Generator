#!/usr/bin/env ruby

sequences = Array.new

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
  
  for i in 0..first_samples.length
    if (first_samples[i] == one)
      first_samples.delete_at(i)
      break
    end
  end
  
  for i in 0..second_samples.length
    if (second_samples[i] == two) 
      second_samples.delete_at(i)
      break
    end
  end
  
  for i in 0..third_samples.length
    if (third_samples[i] == three)
      third_samples.delete_at(i)
      break
    end
  end
  
  for i in 0..fourth_samples.length
    if (fourth_samples[i] == four)
      fourth_samples.delete_at(i)
      break
    end
  end

  sample = "#{one}#{two}#{three}#{four}"
end

first_position_samples = (0..9).to_a + (0..9).to_a
second_position_samples = (0..9).to_a + (0..9).to_a
third_position_samples =  (0..9).to_a + (0..9).to_a
fourth_position_samples =  (0..9).to_a + (0..9).to_a

while(sequences.length <18)
  sample = new_sample(first_position_samples, second_position_samples, third_position_samples, fourth_position_samples)
  unless (sequences.include?(sample))
    sequences << sample
    puts "Sample: #{sample}. Total sequences: #{sequences.length}"
  end
end

unless sequences.uniq!
  puts "All unique sequences!"
end

sequences.each do |seq|
  array = seq.chars.to_a
  puts array.inspect
end
puts "Sequences: #{sequences.inspect}"
puts "Number of Sequences: #{sequences.length}"