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
    @null_piece = NullPiece.instance
    @grid = Array.new(8) { Array.new(8, @null_piece) }
    populate_pieces
  end

  def populate_pieces
    back_line = %w(Rook Knight Bishop King Queen Bishop Knight Rook)
    (0...back_line.length).each do |i|
      self[[0, i]] = eval("#{back_line[i]}.new([0,i], self, :black)")
      self[[1, i]] = Pawn.new([1,i], self, :black)
      self[[6, i]] = Pawn.new([6,i], self, :white)
      self[[7, i]] = eval("#{back_line[i]}.new([7,i], self, :white)")
    end

    # self[[0,0]] = Rook.new([0,0], self, :black)
    # self[[0,7]] = Rook.new([0,0], self, :black)
    # self[[7,0]] = Rook.new([0,0], self, :white)
    # self[[7,7]] = Rook.new([0,0], self, :white)
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

  def in_check?(color)
    opp_color = color == :black ? :white : :black
    king_pos = []
    bad_guys = []

    @grid.each do |row|
      row.each do |piece|
        if piece.is_a?(King) && piece.color == color
          king_pos = piece.pos
        end

        if piece.color == opp_color
          bad_guys << piece
        end
      end
    end

    bad_guys.each do |bad_guy|
      return true if bad_guy.moves.include?(king_pos)
    end
    false
  end

  def dup
    b = Board.new
    @grid.each_index do |row_i|
      @grid[row_i].each_index do |col_i|
        pos = [row_i, col_i]
        if self[pos].is_a?(NullPiece)
          b[pos] = self[pos]
        else
          old = self[pos]
          b[pos] = old.class.new([pos], b, old.color)
        end
      end
    end
    b
  end

  def check_mate?(color)

  end
end

if $PROGRAM_NAME == __FILE__
  b = Board.new
  p b.grid
end
