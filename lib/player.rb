# frozen_string_literal: true

# class Player
class Player
  @@moves = [] # rubocop:disable Style/ClassVars
  def initialize(team)
    @team = team
  end

  def choice
    gets.chomp
  end

  def moves_add(cell)
    @@moves.push(cell)
    true
  end

  def moves
    @@moves
  end

  attr_reader :team
end
