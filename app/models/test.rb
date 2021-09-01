class Test < ApplicationRecord

  has_many :tests_users
  has_many :users, through: :tests_users
  has_many :questions
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  scope :simple, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :find_by_category, -> (category) { joins("JOIN categories ON tests.category_id = categories.id")
                                           .where(categories: { title: category })}

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level }

  def self.find_test_by_category (category)
    find_by_category(category).order('tests.id DESC').pluck(:title)
  end

end
