require 'pry'
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

end

puts Day1.new.part_one
puts Day1.new.part_two