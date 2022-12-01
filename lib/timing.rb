require('benchmark')

module Timing
  def self.time
    time =
      Benchmark.measure do # rubocop:disable Style/ExplicitBlockArgument
        yield
      end
    "Runtime: #{time.real}"
  end
end
