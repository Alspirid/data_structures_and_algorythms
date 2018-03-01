require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @capacity = 8
    @store = StaticArray.new(@capacity)
    @length = 0
  end

  # O(1)
  def [](index)
    raise 'index out of bounds' if index >= @length
    @store[index]
  end

  # O(1)
  def []=(index, value)
    raise 'index out of bounds' if index >= @length
    @store[index] = value
  end

  # O(1)
  def pop
    raise 'index out of bounds' if @length < 1
    @length -= 1
    @store[@length]
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    if @capacity == @length
      resize!
    end
    @store[@length] = val
    @length += 1
  end

  # O(n): has to shift over all the elements.
  def shift
    raise 'index out of bounds' if @length == 0

    shifted_item = @store[0]
    new_store = StaticArray.new(@capacity)
    (1..@length - 1).each do |i|
      new_store[i - 1] = @store[i]
    end
    @store = new_store
    @length -= 1
    shifted_item
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    @capacity += 1
    new_store = StaticArray.new(@capacity)
    @length.times { |i| new_store[i + 1] = @store[i] }
    @store = new_store
    @store[0] = val
    @length += 1
  end

  protected
  
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    new_size = @capacity * 2
    new_store = StaticArray.new(new_size)
    (new_size - 1).times { |i| new_store[i] = @store[i] }
    @store = new_store
    @capacity = new_size
  end
end
