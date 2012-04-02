#!/usr/bin/env ruby

sequences = Array.new

def new_sample(samples)

  one = samples.sample
 
  begin
    two = samples.sample
  end while (two == one)

  begin
    three = samples.sample
  end while ((three == two) || (three == one))

  begin
    four = samples.sample
  end while ((four == three) || (four == two) || (four == one))
  
  sample = "#{one}#{two}#{three}#{four}"
end


samples = (0..9).to_a
while(sequences.length < 100)
  sample = new_sample(samples)
  unless (sequences.include?(sample))
    sequences << sample
  end
end

unless (sequences.uniq!)
  puts "All unique sequences!"
end

puts "Sequences: #{sequences.inspect}"
puts "Number of Sequences: #{sequences.length}"