require 'pry'
require './lib/timing.rb'
require 'set'

class Day4
  attr_reader :pairs, :input, :file_path


  def initialize
    @file_path = File.expand_path('input.csv', __dir__)
    @input     = File.read(file_path)
    @pairs = input.split("\n")
  end

  def part_one
    dupes = []
    pairs.each do |pair|
      elf1_rooms, elf2_rooms = get_elf_sections(pair)
      dupes << true if elf2_rooms.subset?(elf1_rooms) || elf1_rooms.subset?(elf2_rooms)
    end
    dupes.count
  end



  def part_two
    dupes = []
    pairs.each do |pair|
      elf1_rooms, elf2_rooms = get_elf_sections(pair)
      dupes << true if elf2_rooms.intersect?(elf1_rooms)
    end
    dupes.count
  end

  private

  def get_elf_sections(pair)
    elf1, elf2 = pair.split(",")
    elf1_start, elf1_end = elf1.split("-").map(&:to_i)
    elf2_start, elf2_end = elf2.split("-").map(&:to_i)
    elf1_rooms = (elf1_start..elf1_end).to_a.to_set
    elf2_rooms = (elf2_start..elf2_end).to_a.to_set
    return elf1_rooms, elf2_rooms
  end

end

puts "part 1 #{Day4.new.part_one} time = #{Timing.time do Day4.new.part_one end}"
puts "part 2 #{Day4.new.part_two} time = #{Timing.time do Day4.new.part_two end}"
