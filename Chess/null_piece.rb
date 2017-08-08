require_relative 'piece'

class NullPiece < Piece
  # include Singleton
  def symbol
    "  "
  end
end
