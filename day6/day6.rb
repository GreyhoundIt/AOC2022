require 'pry'
require './lib/timing.rb'

class Day6
  attr_reader  :input, :file_path


  def initialize
    @file_path = File.expand_path('input.csv', __dir__)
    @input     = File.read(file_path)
    @test_input = "bvwbjplbgvbhsrlpgdmjqwftvncz"
  end

  def part_one
    decode_pos = 4
    calculate_position(decode_pos)
  end

  def part_two
    decode_pos = 14
    calculate_position(decode_pos)
  end

  private

  def calculate_position(decode_pos)
    subroutine = input
    pos = 0
    subroutine.chars.each_cons(decode_pos) do |sub|
      sub_joined = sub.join
      pos = subroutine =~ /#{sub_joined}/ if sub.tally.length == decode_pos
      return pos + decode_pos unless pos.zero?
    end
  end

end

puts "part 1 #{Day6.new.part_one} time = #{Timing.time do Day6.new.part_one end}"
puts "part 2 #{Day6.new.part_two} time = #{Timing.time do Day6.new.part_two end}"
