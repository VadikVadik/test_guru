class AddAuthorToTest < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :author, :integer
  end
end
