require_relative 'moving_modules'
require 'colorize'

class Rook < Piece
  include SlidingPiece

  MOVES =[
    [0,1],
    [0,2],
    [0,3],
    [0,4],
    [0,5],
    [0,6],
    [0,7],
    [0,0],
    [1,0],
    [2,0],
    [3,0],
    [4,0],
    [5,0],
    [6,0],
    [7,0]
  ]

  def initialize(starting_pos, board, color)
    super
  end

  def mov_dirs

  end

  def symbol
    if @color == :white
      "\u{265C} ".light_white #white rook
    else
      "\u{265C} " #white rook
    end
  end
end
