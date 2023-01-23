class AddEmailToUserAndUniqIndexes < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :email, :string, null: false
    add_index :tests, [:title, :level], unique: true
  end
end
