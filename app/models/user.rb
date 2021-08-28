class User < ApplicationRecord

  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :created_tests, class_name: 'Test'

  def passed_tests_by_level(level)
    self.tests.where(level: level)
  end
end
