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

  # returns the node at the given index
  def at(index, current_index = 0, node = @head)
    return 'Not a valid index' if index >= size || index.negative?
    return node if index == current_index

    current_index += 1
    at(index, current_index, node.next_node)
  end

  # removes the last element from the list
  def pop(node = @head)
    if node.next_node.next_node.nil?
      node.next_node = nil
      @tail = node
      return
    end
    pop(node.next_node)
  end

  # returns true if the passed in value is in the list and otherwise returns false
  def contains?(value, node = @head)
    return false if node.nil?
    return true if node.value == value

    contains?(value, node.next_node)
  end

  # returns the index of the node containing value, or nil if not found
  def find(value, current_index = 0, node = @head)
    return nil if node.nil?
    return current_index if node.value == value

    current_index += 1
    find(value, current_index, node.next_node)
  end

  # represent your LinkedList objects as strings
  def to_s(node = @head, string = [])
    return string << 'nil' if node.nil?

    string << node.value
    to_s(node.next_node, string)
    string.join('->')
  end

  # inserts the node with the provided value at the given index
  def insert_at(value, index, current_index = 0, node = @head)
    return 'Not a valid index' if index > size || index.negative?
    return append(value) if index == size
    return prepend(value) if index.zero?

    if current_index + 1 == index
      new_node = Node.new(value)
      new_node.next_node = node.next_node
      node.next_node = new_node
      return
    end
    current_index += 1
    insert_at(value, index, current_index, node.next_node)
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
list.append(2)
puts list.insert_at(6,8)
puts list.to_s
