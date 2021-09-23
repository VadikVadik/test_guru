class CreateGists < ActiveRecord::Migration[6.1]
  def change
    create_table :gists do |t|
      t.integer :question_id
      t.string :url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
