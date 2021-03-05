# frozen_string_literal: true

require 'pry'

# Board class
class Board
  attr_reader :spaces

  def initialize
    @board = Array.new(8) { [1, 2, 3, 4, 5, 6, 7, 8] }
  end

  def print_board
    @board.each do |row|
      puts row.join
    end
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
    level = {
      0 => @start
    }
    parent = {
      0 => ""
    }
    i = 1
    frontier = [@start]

    until level.values.include?(@finish)
      binding.pry
      frontier.each_entry do |move|
        queue = available_moves(move)
        queue.each_entry do |next_move|
          if level.values.none?(next_move)
            level[i] = next_move
            parent[i] = next_move
          end
        end
        frontier = queue
      end
      i += 1
    end
    #   for #every node in the frontier:
    #     for # u all of the nodes you can reach from those nodes
    #       if #the node v you can reach from that node is not in the hash
    #         level[#node] = i
    #         parent[#node] = u 
    #         #next.apend(v)
    #       end
    #     frontier = next_level
    #     i += 1
    #     end
    #   end
    #end
    p queue
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

new_board = Board.new
new_board.print_board
new_knight = Knight.new([4, 3], [2, 2])
new_knight.knight_moves
