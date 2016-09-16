require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer



  def move(game, mark)
     node = TicTacToeNode.new(game.board, mark)
  #
  #   # node.children.each{|c| return c.previous_move if c.winning_node(mark)}
  #
  #   winner_move(game, mark) || node.children.each{|c| return c.previous_move if c.winning_node?(mark)}

    kids = node.children

    mark == :x ? next_move = :o : next_move = :x

    winner_move(game, mark) || winner_move(game,next_move) || kids.each do |kid|
      if kid.losing_node?(mark)
        winner_move(game,next_move)
      elsif kid.winning_node?(mark)
        random_move(game)
      end
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
