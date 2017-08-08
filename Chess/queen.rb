require_relative 'sliding_piece_module'
require 'colorize'
require_relative 'piece'

class Queen < Piece
  include SlidingPiece

  def initialize(starting_pos, board, color)
    super
  end

  def move_dirs
    horizontal_dirs + diagonal_dirs
  end

  def symbol
    if @color == :white
      "\u{265B} ".light_white #white rook
    else
      "\u{265B} " #white rook
    end
  end
end
