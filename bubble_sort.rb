def bubble_sort(array)
  k = array.length-1
  until k == 0 
    array.each_with_index do |item, index|
        if (index < k && array[index] > array[index+1])
          store_variable = array[index+1]
          array[index+1] = item
          array[index] = store_variable
        end
    end
    k -=1
  end
  array
end

p bubble_sort([4,3,78,2,0,2])
#=> [0,2,2,3,4,78]

