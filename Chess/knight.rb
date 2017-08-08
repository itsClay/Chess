require_relative 'stepping_piece_module'
require 'colorize'

class Knight < Piece
  include SteppingPiece

  def move_dirs
    knight_dirs
  end

  def symbol
    if @color == :white
      "\u{265E} ".light_white #white rook
    else
      "\u{265E} " #white rook
    end
  end
end
