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
    return @root = Node.new(data) if @root.nil?
    return if node.data == data

    if node.left.nil? && data < node.data
      node.left = Node.new(data)
    elsif node.right.nil? && data > node.data
      node.right = Node.new(data)
    else
      data > node.data ? insert(data, node.right) : insert(data, node.left)
    end
  end

  def delete(data, root = @root, node = @root, left = @root.left, right = @root.right)
    return @root = Node.new(data) if @root.nil?

    if data > node.data
      delete(data, node, node.right, node.right.left, node.right.right)
    elsif data < node.data
      delete(data, node, node.left, node.left.left, node.left.right)

    # Node to be deleted is leaf
    elsif left.nil? && right.nil?
      delete_leaf(data, root)

    # Node to be deleted has only one child
    elsif left.nil? || right.nil?
      delete_one_child(data, root, left, right)
    end
  end

  def delete_leaf(data, root)
    data > root.data ? root.right = nil : root.left = nil
  end

  def delete_one_child(data, root, left, right)
    if right.nil?
      data < root.data ? root.left = left : root.right = left
    elsif left.nil?
      data < root.data ? root.left = right : root.right = right
    end
  end
end

tree = Tree.new([2, 3, 4, 5, 6, 7, 8, 9])
tree.build_tree
tree.delete(8)
tree.delete(2)
tree.delete(3)
tree.delete(9)
tree.delete(7)
p tree.pretty_print
