class AddTimerDurationToTest < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :timer, :boolean, default: false
    add_column :tests, :duration, :integer
  end
end
