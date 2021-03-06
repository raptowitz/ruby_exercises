# frozen_string_literal: true

# Board class
class Board
  attr_reader :spaces

  def initialize
    @board = Array.new(8) { [1, 2, 3, 4, 5, 6, 7, 8] }
  end

  def create_spaces
    @spaces = []
    @board.each_with_index do |row, y_cord|
      row.each do |x_cord|
        @spaces.push([x_cord, y_cord + 1])
      end
    end
    @spaces
  end
end

# Knight class
class Knight
  def initialize(start, finish)
    @start = start
    @finish = finish
  end

  def knight_moves
    parent = {}
    frontier = [@start]
    until parent.keys.include?(@finish)
      until frontier[0].nil?
        queue = available_moves(frontier[0])
        queue.each_entry do |next_move|
          parent[next_move] = frontier[0] if parent.keys.none?(next_move)
        end
        frontier.shift
      end
      frontier = queue
    end
    print_path(parent)
  end

  private

  def shortest_path(parent, node = @finish, shortest_path = [])
    return shortest_path.push(@start).reverse if node == @start

    shortest_path.push(node)
    node = parent[node]
    shortest_path(parent, node, shortest_path)
  end

  def print_path(parent)
    path = shortest_path(parent)
    puts "You made it in #{path.length - 1} moves! Here's your path:"
    path.each do |move|
      p move
    end
  end

  def available_moves(current_space)
    x_knight = current_space[0]
    y_knight = current_space[1]

    all_spaces = Board.new.create_spaces
    all_spaces.reject do |space|
      space[0] == x_knight || space[1] == y_knight ||
        (x_knight - space[0]).abs == (y_knight - space[1]).abs ||
        (x_knight - space[0]).abs > 2 || (y_knight - space[1]).abs > 2
    end
  end
end

new_knight = Knight.new([4, 5], [5, 8])
new_knight.knight_moves
