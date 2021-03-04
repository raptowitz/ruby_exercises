# frozen_string_literal: true

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
  def knight_moves(start, finish)
    @start = start
    @finish = finish

    level = {
      0 => start
    }
    parent = {
      0 => ""
    }
    i = 1
    frontier = [start]
    # while frontier #is not empty
    #   next_level = [#all the things you can reach in i moves]
    #   for #every node in the frontier:
    #     for # u all of the nodes you can reach from those nodes
    #       if #the node v you can reach from that node is not in the level dictionary
    #         level[#node] = i
    #         parent[#node] = u 
    #         #next.apend(v)
    #       end
    #     frontier = next_level
    #     i += 1
    #     end
    #   end
    # end
  end

  def available_moves
    x_knight = @start[0]
    y_knight = @start[1]

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
new_knight = Knight.new
new_knight.knight_moves([3, 2], [4, 3])
p new_knight.available_moves
