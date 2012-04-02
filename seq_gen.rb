#!/usr/bin/env ruby
=begin
  * Name: seq_gen.rb
  * Author:   Mathew Gilbert freefallertam _AT_ gmail _DOT_ com
  * Summary:  Calculates unique 4 digit long number sequences where
    each position (1 through 4) contains digits (0 through 9)
    the same number of times. Outputs a .csv file for each sequence.
    Calculates sequences from 10 digits long to 1000 digits long (starts
    running more slowly after 100 digits long, currently tested to
    correctly output 300 digit long sequence).
  * Date:     2-April-2012
=end

=begin
  * Input:    sequences => an array of sequences 4 digits long
  * Returns:  two-dimensional array [position][digit] = frequency of digit occurrence
=end
def calcuate_frequencies(sequences)
freq_array = Array.new(4) {|i|Array.new(10){|i| 0}}
sequences.each do |seq|
for position in 0..3
freq_array[position][seq[position].to_i] += 1
end
end
freq_array
end

=begin
  * Returns:  array of all permutations of numbers 0 to 9, 4 digits long
=end
def generate_sequence()
samples = (0..9).to_a.permutation(4).to_a
end

=begin
  * Input:  frequencies => two-dimensional array ([position][digit] = frequency of digit occurrence)
            digit => the digit to be queried (1 through 4)
            position => the position of the digit to be queried
  * Returns:  the frequency of occurrence of the digit at position
=end
def get_frequency(frequencies,digit,position)
frequencies[position][digit]
end

=begin
  * Input:    str => string to be evaluated
  * Returns:  boolean => true if string evaluates to positive integer, otherwise false.
=end
def is_int?(str)
!!(str =~ /^[+]?[0-9]+$/) #regexp for positive integer, returning boolean
end
=begin
Main script.
Steps through sequences from 10 to ARGV[0] in intervals of ARGV[1], outputs each
unique sequence to a .csv file (number_of_sequences)_unique_sequences.csv
Not presently optimised for speed.
=end
if (is_int?(ARGV[0]) && is_int?(ARGV[1]))
(10..ARGV[0].to_i).step(ARGV[1].to_i) do |number_of_sequences|
puts "Currently calculating #{number_of_sequences} sequences.."
@start_time = Time.new
@sequences = generate_sequence()
@final_sequences = Array.new
while (@final_sequences.length<number_of_sequences)

@test_sequences = Array.new
@final_sequences = Array.new

@sequences.shuffle!
@frequencies = calcuate_frequencies(@sequences)

@sequences.each do |sequence|
sequence_ok = true
@test_sequences << sequence

@test_frequencies = calcuate_frequencies(@test_sequences)
#puts calcuate_frequencies(@final_sequences).inspect

for digit in 0..9
for position in 0..3
if (get_frequency(@test_frequencies,digit,position)>number_of_sequences/10)
sequence_ok = false
end
end
end
if sequence_ok
@final_sequences = @test_sequences.dup
else
@test_sequences.delete(sequence)
end
end
end

File.open("#{number_of_sequences}_unique_sequences.csv","w") do |f|
@final_sequences.each do |sequence|
f.puts sequence.inspect.delete!("[] ")
end
end
puts "Completed in: #{Time.now-@start_time} seconds"
end
else
unless is_int?(ARGV[0])
puts "Invalid first parameter: \'#{ARGV[0]}\' - Number of sequences must be a positive integer"
end
unless is_int?(ARGV[1])
puts "Invalid second parameter: \'#{ARGV[1]}\' - Interval size must be a positive integer"
end
end