class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :confirmable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :issued_badges, dependent: :destroy
  has_many :badges, through: :issued_badges
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :gists, dependent: :destroy

  validates :email, presence: { message: "must be given please" },
                    uniqueness: true,
                    format: { with: /\w+[@]{1}\w+[\.]{1}\w+/, message: "must contain an @ and a dot" }

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def passed_tests_by_level (level)
    self.tests.where(level: level)
  end

  def admin?
    self.type == "Admin"
  end

end
