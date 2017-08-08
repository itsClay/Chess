require_relative 'sliding_piece_module'
require 'colorize'

class Bishop < Piece
  def initialize(starting_pos, board, color)
    super
  end

  def symbol
    if @color == :white
      "\u{265D} ".light_white #white rook
    else
      "\u{265D} " #white rook
    end
  end
end
