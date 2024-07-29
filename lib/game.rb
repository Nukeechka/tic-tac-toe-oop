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

  def show_board
    @board.show_board
  end

  def start_game
    loop do
      cell = gets.chomp
      @board.change_board(@player_x.choice(cell).to_i, @player_x)
      show_board
      cell = gets.chomp
      @board.change_board(@player_o.choice(cell).to_i, @player_o)
      show_board
    end
  end
end
