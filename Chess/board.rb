require_relative 'piece'
require_relative 'null_piece'
require_relative 'rook'
require_relative 'queen'
require_relative 'king'
require_relative 'bishop'
require_relative 'knight'
require_relative 'pawn'


class Board
  attr_reader :grid

  def initialize
    @null_piece = NullPiece.new(nil, self, nil)
    @grid = Array.new(8) { Array.new(8, @null_piece) }
    populate_pieces
  end

  def populate_pieces
    back_line = %w(rook knight bishop king queen bishop knight rook)
    (0...back_line.length).each do |i|
      self[[0, i]] = back_line[i]
    end

    self[[0,0]] = Rook.new([0,0], self, :black)
    self[[0,7]] = Rook.new([0,0], self, :black)
    self[[7,0]] = Rook.new([0,0], self, :white)
    self[[7,7]] = Rook.new([0,0], self, :white)
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
    self[start_pos].update_pos(start_pos)
    self[end_pos].update_pos(end_pos)
  end

  def in_bounds(pos)
    row, col = pos
    return false if row < 0 || col < 0
    return false if row > 7 || col > 7
    true
  end
end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  p b.grid
end
