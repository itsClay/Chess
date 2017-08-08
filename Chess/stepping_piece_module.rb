module SteppingPiece
  def moves
    moves = []
    move_dirs.each do |direction|
      new_move = [@pos.first + direction.first, @pos.last + direction.last]
      moves << new_move unless invalid_piece_move?(new_move)
    end
    moves
  end

  def knight_dirs
    [[2, 1], [2, -1],[-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
  end

  def king_dirs
    [[1, 1], [0, 1], [-1, 1], [-1, 0], [1, 0], [-1, -1], [0, -1], [1, -1]]
  end
end
