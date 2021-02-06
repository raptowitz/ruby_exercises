# frozen_string_literal: true

def merge_sort(array)
  if array.length < 2
    array
  else
    merge_sort(array.slice(0, array.length / 2))
    merge_sort(array.slice(array.length / 2, array.length))
  end
end

puts merge_sort([5, 4, 3, 2])
