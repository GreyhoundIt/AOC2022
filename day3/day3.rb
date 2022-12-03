require 'pry'
require './lib/timing.rb'

class Day3
  attr_reader :suitcases

  ITEMS = {
    'a' => 1,
    'b' => 2,
    'c' => 3,
    'd' => 4,
    'e' => 5,
    'f' => 6,
    'g' => 7,
    'h' => 8,
    'i' => 9,
    'j' => 10,
    'k' => 11,
    'l' => 12,
    'm' => 13,
    'n' => 14,
    'o' => 15,
    'p' => 16,
    'q' => 17,
    'r' => 18,
    's' => 19,
    't' => 20,
    'u' => 21,
    'v' => 22,
    'w' => 23,
    'x' => 24,
    'y' => 25,
    'z' => 26,
    'A' => 27,
    'B' => 28,
    'C' => 29,
    'D' => 30,
    'E' => 31,
    'F' => 32,
    'G' => 33,
    'H' => 34,
    'I' => 35,
    'J' => 36,
    'K' => 37,
    'L' => 38,
    'M' => 39,
    'N' => 40,
    'O' => 41,
    'P' => 42,
    'Q' => 43,
    'R' => 44,
    'S' => 45,
    'T' => 46,
    'U' => 47,
    'V' => 48,
    'W' => 49,
    'X' => 50,
    'Y' => 51,
    'Z' => 52 ,
  }.freeze

  def initialize
    file_path = File.expand_path('input.csv', __dir__)
    input     = File.read(file_path)
    @suitcases = input.split("\n")
  end

  def part_one
    priority = 0
    suitcases.each do |suitcase|
      item = return_duplicates(suitcase).join
      priority += ITEMS[item]
    end
    priority
  end

  def part_two
    priority = 0
    suitcases.each_slice(3) do |group|
      item = special_item(group).join
      priority += ITEMS[item]
    end
    priority
  end

  private

  def return_duplicates(suitcase)
    sec1,sec2 = suitcase.chars.each_slice(suitcase.length / 2).to_a
    sec1 & sec2
  end

  def special_item(group)
    elf1 = group[0].chars
    elf2 = group[1].chars
    elf3 = group[2].chars

    elf1 & elf2 & elf3
  end

end

puts "part 1 #{Day3.new.part_one} time = #{Timing.time do Day3.new.part_one end}"
puts "part 2 #{Day3.new.part_two} time = #{Timing.time do Day3.new.part_two end}"
