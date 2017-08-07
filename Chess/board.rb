require_relative 'piece'
require_relative 'null_piece'


class Board
  attr_reader :grid

  def initialize
    @null_piece = NullPiece.new
    @grid = Array.new(8) { Array.new(8, @null_piece) }

  end

  def []=(pos, val) # setter
    row, col = pos
    return nil if row < 0 || col < 0
    @grid[row][col] = val
  end

  def [](pos) # getter
    row, col = pos
    return nil if row < 0 || col < 0
    @grid[row][col]
  end

  def move_piece(start_pos, end_pos)
    raise "invalid start_pos" if self[start_pos] == @null_piece
    raise "cant move there." if self[end_pos] == nil || !@null_piece
    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
  end
end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  p b.grid
end
