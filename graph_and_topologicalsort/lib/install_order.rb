# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

require_relative 'graph'
require_relative 'topological_sort'

def install_order(arr)
  vertices = []
  max_id = 0
  arr.each do |file|
    max_id = [file.max, max_id].max
  end
  (1..max_id).each do |id|
    vertices << Vertex.new(id)
  end
  arr.each do |file|
    Edge.new(vertices[file[1] - 1], vertices[file[0] - 1])
  end
  topological_sort(vertices).map(&:value)  
end
