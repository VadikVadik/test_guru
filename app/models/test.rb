class Test < ApplicationRecord

  has_many :tests_users
  has_many :users, through: :tests_users
  has_many :questions
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  def self.find_by_category(category)
    Test.joins("JOIN categories ON tests.category_id = categories.id")
        .where(categories: { title: category })
        .order('tests.id DESC').pluck(:title)
  end
end
