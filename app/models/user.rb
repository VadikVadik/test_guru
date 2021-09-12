require 'digest/sha1'

class User < ApplicationRecord

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'

  validates :email, uniqueness: true
  validates :email, format: { with: /\w+[@]{1}\w+[\.]{1}\w+/, message: "Email must contain an @ and a dot" }

  has_secure_password

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def passed_tests_by_level (level)
    self.tests.where(level: level)
  end

end
