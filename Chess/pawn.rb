require 'colorize'

class Pawn < Piece
  def initialize(starting_pos, board, color)
    super
  end

  def symbol
    if @color == :white
      "\u{265F} ".light_white #white rook
    else
      "\u{265F} " #white rook
    end
  end
end
