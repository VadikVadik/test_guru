class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'

  validates :name, :email, presence: { message: "must be given please" }
  validates :email, uniqueness: true,
                    format: { with: /\w+[@]{1}\w+[\.]{1}\w+/, message: "must contain an @ and a dot" }

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def passed_tests_by_level (level)
    self.tests.where(level: level)
  end

end
