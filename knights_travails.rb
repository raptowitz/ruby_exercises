# frozen_string_literal: true

# Board class
class Board
  def initialize
    @board = Array.new(8) { Array.new(8, ' ? ') }
  end

  def print_board
    @board.each do |row|
      puts row.join
    end
  end
end

# Knight class
class Knight
end

new_board = Board.new
new_board.print_board
