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
  sequence
end

# puts fibs(8)

def fibs_rec(num)
  if num < 2
    num
  else
    fibs_rec(num - 1) + (num - 2)
  end
end

puts fibs_rec(5)
