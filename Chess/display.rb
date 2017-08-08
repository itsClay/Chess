require 'colorize'
require_relative 'board'
require_relative 'cursor'


class Display
  attr_accessor :cursor

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render
    @board.grid.each_with_index do |row, row_i|
      row.each_with_index do |square, col_i|
        piece_symbol = @board[[row_i, col_i]].symbol
        if @cursor.cursor_pos == [row_i, col_i]
          print piece_symbol.on_light_red
        elsif row_i.odd?
          print piece_symbol.on_light_black if col_i.odd?
          print piece_symbol.on_white if col_i.even?
        else
          print piece_symbol.on_light_black if col_i.even?
          print piece_symbol.on_white if col_i.odd?
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
  while true
    d.cursor.get_input
    system("clear")
    d.render
  end
end
