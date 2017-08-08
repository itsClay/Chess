require_relative 'sliding_piece_module'
require 'colorize'
require_relative 'piece'

class Rook < Piece
  include SlidingPiece

  def initialize(starting_pos, board, color)
    super
  end

  def symbol
    if @color == :white
      "\u{265C} ".light_white #white rook
    else
      "\u{265C} " #white rook
    end
  end
end
