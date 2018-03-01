require_relative "heap"

class Array
  def heap_sort!
    (0...self.length).each do |first|
    BinaryMinHeap.heapify_up(self, self.length - 1 - first, self.length - first)
    self[0], self[self.length - 1 - first] = self[self.length - 1 - first], self[0]
    end
    self.reverse!
  end
end
