class Category < ApplicationRecord
  has_many :tests

  scope_default { order('categories.title ASC') }

  validates :title, presence: true
end
