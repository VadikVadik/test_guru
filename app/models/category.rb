class Category < ApplicationRecord
  has_many :tests, dependent: :destroy

  default_scope { order('categories.title ASC') }

  validates :title, presence: true
end
