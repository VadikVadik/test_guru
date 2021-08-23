class Test < ApplicationRecord
  def self.fing_by_category(category)
    current_category_id = Category.where(title: category).id
    Test.order('id DESC').where(category_id: current_category_id).pluck(:title)
  end
end
