# frozen_string_literal: true

# full list
class LinkedList
  attr_reader :head, :tail
  def initialize
    @head = nil
    @tail = nil
  end

  # adds a new node containing value to the end of the list
  def append(value)
    if @head.nil?
      @head = Node.new(value)
      @tail = @head
    else
      @tail.next_node = Node.new(value)
      @tail = @tail.next_node
    end
  end

  # adds a new node containing value to the start of the list
  def prepend(value)
    if @head.nil?
      @head = Node.new(value)
      @tail = @head
    else
      new_node = Node.new(value)
      new_node.next_node = @head
      @head = new_node
    end
  end

  # total number of nodes in the list
  def size(node = @head, count = 0)
    return count if node.nil?

    count += 1
    size(node.next_node, count)
  end

  def at(index, current_index = 0, node = @head)
    return 'Not a valid index' if index >= size
    return node if index == current_index

    current_index += 1
    at(index, current_index, node.next_node)
  end

  def pop(node = @head)
    if node.next_node.next_node.nil?
      node.next_node = nil
      @tail = node
      return
    end
    pop(node.next_node)
  end

  def contains?(value, node = @head)
    return false if node.nil?
    return true if node.value == value

    contains?(value, node.next_node)
  end
end

# Node class
class Node
  attr_accessor :value, :next_node
  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end

list = LinkedList.new
list.append(5)
list.append(4)
list.append(3)
p list.contains?(3)
p list
