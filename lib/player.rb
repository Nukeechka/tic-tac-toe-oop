# frozen_string_literal: true

# class Player
class Player
  @@moves = [] # rubocop:disable Style/ClassVars
  def initialize(team)
    @team = team
  end

  def move # rubocop:disable Metrics/MethodLength
    begin # rubocop:disable Style/RedundantBegin
      number = Kernel.gets.match(/\d+/)[0].to_i
      if @@moves.none?(number) && number.positive? && number < 10
        @@moves << number
      else
        continue
      end
    rescue StandardError
      puts 'Erroneous inputs! Try again..'
      retry
    else
      number
    end
  end

  attr_reader :team
end
