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

  def start_game # rubocop:disable Metrics/MethodLength
    puts "\nFirst start a X"
    puts 'Enter number of cell from 1 to 9:'
    loop do
      result = @board.update_board(@player_x)
      unless result == false
        puts "Game finish! Winner is #{result}"
        break
      end
      if @board.all_cells_filled?
        puts 'Game finish. Draw!'
        break
      end
      result = @board.update_board(@player_o)
      unless result == false
        puts "Game finish! Winner is #{result}"
        break
      end
    end
  end
end
