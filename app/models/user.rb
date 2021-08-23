class User < ApplicationRecord
  @passed_tests = []

  def passed_tests_by_level(level)
    @passed_tests.select { |test| test.level == level }
  end
end
