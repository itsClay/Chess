require_relative 'moving_modules'
require 'colorize'

class Knight < Piece
  def initialize(starting_pos, board, color)
    super
  end

  def symbol
    if @color == :white
      "\u{265E} ".light_white #white rook
    else
      "\u{265E} " #white rook
    end
  end
end
