# frozen_string_literal: true

# class Board
class Board
  def initialize
    @grid = Array.new(3) { Array.new(3, '*') }
  end

  def show_board
    i = 1
    grid.each do |row|
      row.each do |cell|
        print cell
        print "\n" if (i % 3).zero?
        i += 1
      end
    end
  end

  def change_board(cell, player) # rubocop:disable Metrics/AbcSize,Metrics/CyclomaticComplexity,Metrics/MethodLength
    case cell
    when 1
      grid[0][0] = player.team
    when 2
      grid[0][1] = player.team
    when 3
      grid[0][2] = player.team
    when 4
      grid[1][0] = player.team
    when 5
      grid[1][1] = player.team
    when 6
      grid[1][2] = player.team
    when 7
      grid[2][0] = player.team
    when 8
      grid[2][1] = player.team
    when 9
      grid[2][2] = player.team
    end
  end

  protected

  attr_accessor :grid
end
