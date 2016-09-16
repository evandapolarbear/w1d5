require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def other_mark(mark)
    mark == :x ? other = :o : other = :x
  end

  def losing_node?(evaluator)

    return false if @board.winner == evaluator
    return true if @board.winner == other_mark(evaluator)

    childs = self.children

    childs.each do |child|
      bool = child.losing_node?(evaluator)
      return true if bool
    end
    false

  end

  def winning_node?(evaluator)
    !self.losing_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children = []

    @next_mover_mark == :x ? next_move = :o : next_move = :x

    @board.rows.each_with_index do |row, x|
      row.each_with_index do |space, y|
        if @board.empty?([x,y])
          board_copy = @board.dup
          board_copy[[x,y]]=@next_mover_mark
          children << TicTacToeNode.new(board_copy, next_move, [x,y])
        end
      end
    end

    children
  end


end

board = Board.new()
node = TicTacToeNode.new(board, :x)
node_childrens = node.children
node_childrens.each do |child|
  child.board.rows.each do |row|
    p row
  end
  puts
  puts
end
