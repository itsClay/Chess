require_relative 'moving_modules'
require 'colorize'

class Queen < Piece
  def initialize(starting_pos, board, color)
    super
  end

  def symbol
    if @color == :white
      "\u{265B} ".light_white #white rook
    else
      "\u{265B} " #white rook
    end
  end
end
