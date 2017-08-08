require_relative 'stepping_piece_module'
require 'colorize'

class King < Piece
  include SteppingPiece

  def move_dirs
    king_dirs
  end

  def symbol
    if @color == :white
      "\u{265A} ".light_white #white rook
    else
      "\u{265A} " #white rook
    end
  end
end
