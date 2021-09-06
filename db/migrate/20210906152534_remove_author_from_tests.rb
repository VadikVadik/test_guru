class RemoveAuthorFromTests < ActiveRecord::Migration[6.1]
  def change
    remove_column :tests, :author, :integer
  end
end
