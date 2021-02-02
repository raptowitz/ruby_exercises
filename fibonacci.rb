# frozen_string_literal: true

def fibs(num)
  sequence = []
  (0..num).each do |n|
    if n < 2
      sequence.push(n)
    else
      sequence.push(sequence[n - 1] + sequence[n - 2])
    end
  end
  puts sequence[0..num - 1]
end

fibs(8)
