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

def fibs_rec_simple(num)
  if num < 2
    num
  else
    fibs_rec(num - 1) + (num - 2)
  end
end

puts fibs_rec_simple(5)

def fibs_rec(num, seq = [0, 1])
  return seq if num < 2

  seq << seq[-1] + seq[-2]
  fibs_rec(num - 1, seq)
end

# puts fibs_rec(7)
