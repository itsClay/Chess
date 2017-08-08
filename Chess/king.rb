require_relative 'sliding_piece_module'
require 'colorize'

class King < Piece
  def initialize(starting_pos, board, color)
    super
  end

  def symbol
    if @color == :white
      "\u{265A} ".light_white #white rook
    else
      "\u{265A} " #white rook
    end
  end
end
