# frozen_string_literal: true

def merge_sort(array)
  if array.length < 2
    array
  else
    # divide
    left = array.slice(0, array.length / 2)
    right = array.slice(array.length / 2, array.length)

    # conquer
    merge(merge_sort(left), merge_sort(right))
  end
end

def merge(left, right, sorted_array = [])
  i_left = 0
  i_right = 0
  i_sa = 0
  while i_left < left.length && i_right < right.length
    if left[i_left] < right[i_right]
      sorted_array[i_sa] = left[i_left]
      i_left += 1
    else
      sorted_array[i_sa] = right[i_right]
      i_right += 1
    end
    i_sa += 1
  end

  if i_left == left.length
    sorted_array.push(right[i_right..right.length])
  else
    sorted_array.push(left[i_left..left.length])
  end
  sorted_array.flatten
end

puts merge_sort([5, 4, 3, 2, 1])
