require 'pry'
require './lib/timing.rb'

class Day7
  attr_reader  :input, :file_path


  def initialize
    @file_path = File.expand_path('input.csv', __dir__)
    @input     = File.readlines(file_path)

  end

  def part_one
    dir_sizes, results = get_dir_sizes

    p results
    p dir_sizes
    p dir_sizes.inject(0){ |sum, (dir,size)| size <= 100000 ? sum + size : sum }
  end

  def part_two
    dir_sizes, results = get_dir_sizes
    total = 70000000
    needed = 30000000
    free =  total - dir_sizes[['/']]
    delete = needed - free
    puts "Total: #{total}, Free: #{free}, Needed: #{needed}, To Delete: #{delete}"

    p dir_sizes.values.sort.find { |size| size > delete }


  end

  private

  def get_dir_sizes
    pwd = []
    dir_sizes = Hash.new { |h, k| h[k] = 0 }
    results = input.map(&:chomp)
                   .map { _1.split(' ') }
                   .each do |line|
      case line
      in ['$', 'cd', '..']
        puts "going up a level"
        pwd.pop
        puts pwd
      in ['$', 'cd', dir]
        puts "changing into #{dir}"
        pwd << dir
        puts pwd
      in ['$', 'ls']
        puts "listing files"
      in ['dir', dirname]
        puts "encountered dir #{dirname}"
      in [size, filename]
        pwd.length.times do |x|
          dir_sizes[pwd[0..x]] += size.to_i
        end
        puts "encountered #{filename} of size #{size}"
      end
    end
    return dir_sizes, results
  end

end

puts "part 1 #{Day7.new.part_one} time = #{Timing.time do Day7.new.part_one end}"
puts "part 2 #{Day7.new.part_two} time = #{Timing.time do Day7.new.part_two end}"
