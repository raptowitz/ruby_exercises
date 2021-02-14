# frozen_string_literal: true

require 'pry'

# Node class
class Node
  include Comparable
  attr_accessor :data, :left, :right

  def initialize(data = nil)
    @data = data
    @left = nil
    @right = nil
  end

  def <=>(other)
    data <=> other.data
  end
end

# Tree class
class Tree
  def initialize(array)
    @array = array.sort.uniq
    @root = nil
  end

  def build_tree(array = @array, first = 0, last = @array.length - 1)
    return nil if first > last

    mid = (first + last) / 2
    root = Node.new(array[mid])

    root.left = build_tree(array, first, mid - 1)
    root.right = build_tree(array, mid + 1, last)
    @root = root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def insert(data, node = @root)
    if node.left.nil? && data < node.data
      node.left = Node.new(data)
    elsif node.right.nil? && data > node.data
      node.right = Node.new(data)
    else
      data > node.data ? insert(data, node.right) : insert(data, node.left)
    end
  end
end

tree = Tree.new([2, 3, 4, 6, 7, 8, 9])
tree.build_tree
tree.insert(5)
p tree.pretty_print
