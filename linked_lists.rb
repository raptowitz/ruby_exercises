# frozen_string_literal: true

# full list
class LinkedList
  def initialize
    @head = nil
  end

  # adds a new node containing value to the end of the list
  def append(value)
    if @head.nil?
      @head = Node.new
      @head.value = value
    else
      current_node = @head
      current_node = current_node.next_node while current_node.next_node != nil

      current_node.next_node = Node.new
      current_node.next_node.value = value
    end
  end
end

# Node class
class Node
  attr_accessor :value, :next_node
  def initialize
    @value = nil
    @next_node = nil
  end
end

list = LinkedList.new
list.append(5)
list.append(4)
list.append(3)
p list
