require 'pry'
require './lib/timing.rb'
require 'set'

class Day5
  attr_reader :instructions, :input, :file_path

  def initialize
    @file_path = File.expand_path('input.csv', __dir__)
    @input     = File.read(file_path)
    @instructions = input.split("\n")
  end

  def part_one
    test_array = [[],%w[Z N], %w[M C D], %w[P]]
    real_array = [[],
                  %w[N S D C V Q T],
                  %w[M F V],
                  %w[F Q W D P N H M],
                  %w[D Q R T F],
                  %w[R F M N Q H V B],
                  %w[C F G N P W Q],
                  %w[W F R L C T],
                  %w[T Z N S],
                  %w[M S D J R Q H N]
                  ]
    instructions.each do |command|
      amount, start, finish = command.scan(/\d+/).map(&:to_i)

      cargo = real_array[start].pop(amount)
      real_array[finish].push(cargo.reverse).flatten!
    end
    real_array.map(&:last).compact.join
  end

  def part_two
    test_array = [[],%w[Z N], %w[M C D], %w[P]]
    real_array = [[],
                  %w[N S D C V Q T],
                  %w[M F V],
                  %w[F Q W D P N H M],
                  %w[D Q R T F],
                  %w[R F M N Q H V B],
                  %w[C F G N P W Q],
                  %w[W F R L C T],
                  %w[T Z N S],
                  %w[M S D J R Q H N]
    ]
    instructions.each do |command|
      amount, start, finish = command.scan(/\d+/).map(&:to_i)

      cargo = real_array[start].pop(amount)
      real_array[finish].push(cargo).flatten!

    end
    real_array.map(&:last).compact.join

  end
end

puts "part 1 #{Day5.new.part_one} time = #{Timing.time do Day5.new.part_one end}"
puts "part 2 #{Day5.new.part_two} time = #{Timing.time do Day5.new.part_two end}"
