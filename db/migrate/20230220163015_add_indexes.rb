class AddIndexes < ActiveRecord::Migration[6.0]
  def change
    add_index :tests, :level
    add_index :answers, :correct
  end
end
