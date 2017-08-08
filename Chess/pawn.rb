require 'colorize'

class Pawn < Piece
  attr_reader :starting_pos, :pos

  def initialize(starting_pos, board, color)
    @starting_pos = starting_pos.dup
    super
  end

  def moves
    # move_dirs + side_attacks + forward_steps
    moves = []
    # side_attacks logic
    side_attacks.each do |direction|
      new_move = [@pos.first + direction.first, @pos.last + direction.last]
      unless invalid_piece_move?(new_move)
        opp_color = @color == :black ? :white : :black
        moves << new_move if @board[new_move].color == opp_color
      end
    end

    # forward_2_steps logic
    forward_2_steps_move = [@pos.first + forward_2_steps.first,
                            @pos.last + forward_2_steps.last]
    if @board[forward_2_steps_move].is_a?(NullPiece)
      moves << forward_2_steps_move
    end

    # forward_1_step logic
    forward_1_step_move = [@pos.first + forward_1_step.first,
                          @pos.last + forward_1_step.last]
    if @board[forward_1_step_move].is_a?(NullPiece)
      moves << forward_1_step_move
    end

    moves
  end


  def symbol
    if @color == :white
      "\u{265F} ".light_white #white rook
    else
      "\u{265F} " #white rook
    end
  end

  def forward_2_steps
    if at_start_row?
      case @color
      when :black
        [2, 0]
      when :white
        [-2, 0]
      end
    else
      []
    end
  end

  def forward_1_step
    case @color
    when :black
      [1, 0]
    when :white
      [-1, 0]
    end
  end

  def side_attacks
    case @color
    when :black
      [[1, -1], [1, 1]]
    when :white
      [[-1, -1], [-1, 1]]
    end
  end

  def at_start_row?
    return true if @pos == @starting_pos
    false
  end
end
