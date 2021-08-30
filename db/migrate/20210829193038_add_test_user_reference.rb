class AddTestUserReference < ActiveRecord::Migration[6.1]
  def change
    add_reference(:tests, :author, foreign_key: {to_table: :users})
    add_reference(:users, :created_tests, foreign_key: {to_table: :tests})
  end
end
