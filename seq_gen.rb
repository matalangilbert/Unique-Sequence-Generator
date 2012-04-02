#!/usr/bin/env ruby

def calcuate_frequencies(sequences)
  freq_array = Array.new(4) {|i|Array.new(10){|i| 0}}
  sequences.each do |seq|
      for position in 0..3
        freq_array[position][seq[position].to_i] += 1
      end
  end
  freq_array
end

def generate_sequence()
  samples = (0..9).to_a.permutation(4).to_a
end

def get_frequency(frequencies,digit,position)
  frequencies[position][digit]
end

@sequences = generate_sequence()
number_of_sequences = 50
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
puts "Final Frequencies: #{calcuate_frequencies(@final_sequences)}"
puts "Final Length: #{@final_sequences.length}\nFinal Sequences: #{@final_sequences}"