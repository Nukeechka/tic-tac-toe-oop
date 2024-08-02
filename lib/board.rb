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

  def diagonal_check # rubocop:disable Metrics/AbcSize
    return false if grid[1][1] == '*'

    center_cell = grid[1][1]
    left_diagonal_cells = [grid[0][0], center_cell, grid[2][2]]
    right_diagonal_cells = [grid[0][2], center_cell, grid[2][0]]
    return center_cell if left_diagonal_cells.all?(center_cell)
    return center_cell if right_diagonal_cells.all?(center_cell)

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

  def get_spot(player)
    index_player = player.move

    i = 1
    grid.each_with_index do |row, index_row|
      row.each_with_index do |_cell, index_cell|
        return [index_row, index_cell] if i == index_player

        i += 1
      end
    end
  end

  def update_board(player)
    cell = get_spot(player)
    grid[cell[0]][cell[1]] = player.team
    show_board
    check_board = [row_check, column_check, diagonal_check]
    unless check_board.all?(false)
      check_board.each do |result|
        return result unless result == false
      end
    end
    false
  end

  protected

  attr_accessor :grid, :moves
end
