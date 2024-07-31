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
    return -1 if all_cells_filled?

    if player.moves.include?(cell)
      print "You can't choose this cell, change your move to another: \n"
      return false
    end
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
    show_board
    player.moves_add(cell)
  end

  def all_cells_filled?
    grid.each do |row|
      row.each do |cell|
        return false if cell == '*'
      end
    end
    true
  end

  def column_check
    transposed_grid = grid[0].zip(grid[1], grid[2])
    transposed_grid.each do |row|
      count = 0
      temp = row[0]
      row.each do |cell|
        count += 1 if temp == cell && cell != '*'
        return temp if count == 3
      end
    end
    false
  end

  def row_check
    grid.each do |row|
      count = 0
      temp = row[0]
      row.each do |cell|
        count += 1 if temp == cell && cell != '*'
        return temp if count == 3
      end
    end
    false
  end

  def check_combination
    return false if row_check == false && column_check == false

    return row_check if row_check != false

    column_check if column_check != false
  end

  protected

  attr_accessor :grid
end
