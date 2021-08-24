class Test < ApplicationRecord
  def self.find_by_category(category)
    Test.joins("JOIN categories ON tests.category_id = categories.id AND categories.title = '#{category}'")
        .order('tests.id DESC').pluck(:title)
  end
end
