class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length < 2
    pivot = array[0]
    left = array.select { |el| el < pivot }
    right = array.select { |el| el > pivot }
    QuickSort.sort1(left) + [pivot] + QuickSort.sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
     return array if length <= 1
     prc ||= Proc.new { |x, y| x <=> y }
     pivot_index = QuickSort.partition(array, start, length, &prc)
     left = pivot_index - start
     right = length - left - 1
     QuickSort.sort2!(array, start, left, &prc)
     QuickSort.sort2!(array, pivot_index + 1, right, &prc)

     array
   end
  
  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |x, y| x <=> y }
    pivot_index = start
    pivot = array[start]
    (start + 1...start + length).each do |index|
      if prc.call(pivot, array[index]) == 1
        array[pivot_index], array[index] = array[index], array[pivot_index + 1]
        array[pivot_index + 1] = pivot        
        pivot_index += 1
      end  
    end
    pivot_index
  end
end
