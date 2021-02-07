# frozen_string_literal: true

require 'pry'

def merge_sort(array)
  if array.length < 2
    array
  else
    # divide
    b = array.slice(0, array.length / 2)
    c = array.slice(array.length / 2, array.length)

    # conquer
   binding.pry
    merge(merge_sort(b), merge_sort(c))
  end
end

def merge(b, c, sorted_array = [])
 binding.pry
  i_b = 0
  i_c = 0
  i_sa = 0
  while i_b < b.length && i_c < c.length
    if b[i_b] < c[i_c]
      sorted_array[i_sa] = b[i_b]
      i_b += 1
    else
      sorted_array[i_sa] = c[i_c]
      i_c += 1
    end
    i_sa += 1
  end

  if i_b == b.length + 1
    sorted_array << c[i_c..c.length]
  else
    sorted_array << b[i_b..b.length]
  end
  sorted_array.flatten
end


puts merge_sort([5, 4, 3, 2])
