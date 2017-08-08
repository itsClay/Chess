class Piece
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
end
