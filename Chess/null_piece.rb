require_relative 'piece'
require 'singleton'

class NullPiece < Piece
  include Singleton

  def initialize
  end

  def symbol
    "  "
  end

  def moves
    []
  end

  def move_dirs
    []
  end
end
