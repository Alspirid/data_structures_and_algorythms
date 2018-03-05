class BSTNode
  attr_accessor :right, :left, :parent
  attr_reader :value

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
    @parent = nil
  end
  
  def left=(left_child)
    @left = left_child
  end  
  
  def right=(right_child)
    @right = right_child
  end  

end
