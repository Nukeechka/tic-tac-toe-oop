# frozen_string_literal: true

require './lib/player'
require './lib/board'

# class Game
class Game
  attr_reader :board

  def initialize
    @player_x = Player.new('X')
    @player_o = Player.new('O')
    @board = Board.new
  end

  def start_game # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
    loop do
      if @board.change_board(@player_x.choice.to_i, @player_x) == -1
        print 'Game is finish!'
        break
      end
      while @board.change_board(@player_x.choice.to_i, @player_x) == false
      end
      if @board.check_combination != false
        print "Winner is #{@board.check_combination}"
        return
      end
      loop do
        result = @board.change_board(@player_o.choice.to_i, @player_o)
        break if result != false
      end
    end
  end
end
