module SlidingPiece

  def moves
    moves = []
    move_dirs.each do |direction|
      moves += grow_unblocked_moves_in_dir(direction)
    end
    moves
  end

  def move_dirs
  end

  def horizontal_dirs
    [[0, 1], [1, 0], [0, -1], [-1, 0]]
  end

  def diagonal_dirs
    [[1, 1], [1, -1], [-1, -1], [-1, 1]]
  end

  def grow_unblocked_moves_in_dir(direction) # direction = [delta_row, delta_col]
    d_row, d_col = direction
    result = []
    next_move = [@pos.first + d_row, @pos.last + d_col]

    until invalid_piece_move?(next_move)
      result << next_move
      next_move = [next_move.first + d_row, next_move.last + d_col]
    end

    result
  end
end
