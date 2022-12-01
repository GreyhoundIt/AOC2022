require 'pry'
require './lib/timing.rb'

class Day1
  attr_reader :elves
  def initialize
    file_path = File.expand_path('input.csv', __dir__)
    input     = File.read(file_path)
    @elves = input.split("\n\n")
  end

  def part_one
    highest_calories = 0
    elves.map do |elf|
      calories = elf.split("\n").map(&:to_i).sum
      highest_calories = calories if calories > highest_calories
    end
    highest_calories
  end

  def part_two
    calories = []
    elves.map do |elf|
      calories << elf.split("\n").map(&:to_i).sum
    end
    calories.sort.last(3).sum
  end

  def part_one_test
    calories = []
    elves.map do |elf|
      calories << elf.split("\n").map(&:to_i).sum
    end
    calories.sort.last
  end

end

puts "part 1 #{Day1.new.part_one} time = #{Timing.time do Day1.new.part_one end}"
puts "part 1 test #{Day1.new.part_one_test} time = #{Timing.time do Day1.new.part_one_test end}"
puts "part 2 #{Day1.new.part_two} time = #{Timing.time do Day1.new.part_two end}"