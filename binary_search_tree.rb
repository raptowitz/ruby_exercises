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

  def delete(data, root = @root, node = @root)
    return @root = Node.new(data) if @root.nil?

    if data > node.data
      delete(data, node, node.right)
    elsif data < node.data
      delete(data, node, node.left)
    elsif node.left.nil? && node.right.nil?
      delete_leaf(data, root)
    elsif node.left.nil? || node.right.nil?
      delete_one_child(data, root, node)
    else
      delete_two_children(node)
    end
  end

  def delete_leaf(data, root)
    data > root.data ? root.right = nil : root.left = nil
  end

  def delete_one_child(data, root, node)
    if node.right.nil?
      data < root.data ? root.left = node.left : root.right = node.left
    elsif node.left.nil?
      data < root.data ? root.left = node.right : root.right = node.right
    end
  end

  def delete_two_children(node)
    current = node.right
    while !current.left.nil?
      current = current.left
    end
    delete(current.data)
    node.data = current.data
  end

  def find(data, node = @root)
    return 'No node in tree' if node.nil?
    return node if node.data == data

    data > node.data ? find(data, node.right) : find(data, node.left)
  end

  def level_order_iterative
    queue = [@root]
    array = []
    until queue[0].nil?
      array.push(queue[0].data)
      queue.push(queue[0].left) unless queue[0].left.nil?
      queue.push(queue[0].right) unless queue[0].right.nil?
      queue.shift
    end
    array
  end

  def level_order_recursive(queue = [@root], array = [])
    return array if queue[0].nil?

    array.push(queue[0].data)
    queue.push(queue[0].left) unless queue[0].left.nil?
    queue.push(queue[0].right) unless queue[0].right.nil?
    queue.shift
    level_order_recursive(queue, array)
  end

  def inorder(root = @root, array = [])
    return array if node.nil?

    array.push(root.data)
    inorder(root.left, array)
    inorder(root.right, array)
  end
end

tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
tree.build_tree
# tree.delete(3)
# tree.delete(9)
# tree.delete(7)
p tree.inorder
tree.pretty_print
