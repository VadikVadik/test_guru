class AddAssociations < ActiveRecord::Migration[6.1]
  def change
    create_join_table :tests, :users, id: false do |t|
       t.index :test_id
       t.index :user_id
    end
  end
end
