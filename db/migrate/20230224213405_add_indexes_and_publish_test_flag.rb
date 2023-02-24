class AddIndexesAndPublishTestFlag < ActiveRecord::Migration[6.0]
  def change
    add_index :tests, :level
    add_index :answers, :correct
    add_column :tests, :publish, :boolean, null: false, default: false
  end
end
