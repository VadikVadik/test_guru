class User < ApplicationRecord

  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'

  scope :passed_tests_by_level, -> (level) { self.tests.where(level: level) }

  validates :name, :email, presence: true

end
