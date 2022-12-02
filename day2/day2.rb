require 'pry'
require './lib/timing.rb'

class Day2
  attr_reader :rounds

  def initialize
    file_path = File.expand_path('input.csv', __dir__)
    input     = File.read(file_path)
    @rounds = input.split("\n")
  end

  def part_one
    total_score = 0
    rounds.each do |round|
      total_score += game_result(round)
      total_score += hand_result(round)
    end
    total_score
  end

  def part_two
    total_score = 0
    rounds.each do |round|
      round[2] = hand_to_play(round)
      total_score += game_result(round)
      total_score += hand_result(round)
    end
    total_score
  end

  private

  def hand_to_play(round)
    player1, player2 = round.split
    # X means you need to lose, Y means you need to end the round in a draw, and Z means you need to win. Good luck!"
    # a x rock
    # b y paper
    # c z scissors
    case player2
    when 'X' # lose
      return 'Y' if player1 == 'C'
      return 'Z' if player1 == 'A'
      return 'X' if player1 == 'B'
    when 'Y' # draw
      return 'Z' if player1 == 'C'
      return 'X' if player1 == 'A'
      return 'Y' if player1 == 'B'
    else # win
      return 'Z' if player1 == 'B'
      return 'X' if player1 == 'C'
      return 'Y' if player1 == 'A'
    end
  end

  def game_result(round)
    player1, player2 = round.split
    case player2
    when 'X'
      return 6 if player1 == 'C'
      return 3 if player1 == 'A'
      return 0 if player1 == 'B'
    when 'Y'
      return 6 if player1 == 'A'
      return 3 if player1 == 'B'
      return 0 if player1 == 'C'
    else
      return 6 if player1 == 'B'
      return 3 if player1 == 'C'
      return 0 if player1 == 'A'
    end
  end

  def hand_result(round)
    _, player2 = round.split
    case player2
    when 'X'
      1
    when 'Y'
      2
    else
      3
    end
  end

end

puts "part 1 #{Day2.new.part_one} time = #{Timing.time do Day2.new.part_one end}"
puts "part 2 #{Day2.new.part_two} time = #{Timing.time do Day2.new.part_two end}"
