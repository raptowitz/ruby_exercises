# frozen_string_literal: true

# Node class
class Node
  include Comparable
  attr_accessor :value, :left, :right

  def initialize(value = nil)
    @value = value
    @left = nil
    @right = nil
  end

  def <=>(other)
    value <=> other.value
  end
end

four = Node.new(4)
three = Node.new(3)

p [four, three].sort
