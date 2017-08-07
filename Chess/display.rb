require 'colorize'
require_relative 'board'
require_relative 'cursor'

class Display
  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render
    @board.grid.each_with_index do |row, row_i|
      row.each_with_index do |square, col_i|
        if @cursor.cursor_pos == [row_i, col_i]
          print "  ".on_light_red
        elsif row_i.odd?
          print "  ".on_light_black if col_i.odd?
          print "  " if col_i.even?
        else
          print "  ".on_light_black if col_i.even?
          print "  " if col_i.odd?
        end
      end
      print "\n"
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  b = Board.new
  d = Display.new(b)
  d.render
end
