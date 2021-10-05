class Category < ApplicationRecord
  has_many :tests, dependent: :delete_all

  default_scope { order('categories.title ASC') }

  validates :title, presence: true
end
