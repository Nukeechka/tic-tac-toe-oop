# frozen_string_literal: true

# class Player
class Player
  def initialize(team)
    @team = team
  end

  def choice(cell)
    cell
  end

  attr_reader :team
end
