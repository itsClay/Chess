class Piece
  attr_reader :color
  def initialize(starting_pos, board, color)
    @pos = starting_pos # [row, col]
    @board = board # board obj
    @color = color
  end

  def moves
    # return array of pos
  end

  def update_pos(new_pos)
    @pos = new_pos
    
  end

  def invalid_piece_move?(pos)
    row, col = pos
    if row < 0 || row > 7
      return true
    elsif col < 0 || col > 7
      return true
    elsif @board[pos].color == @color
      return true
    end
    false
  end
end
