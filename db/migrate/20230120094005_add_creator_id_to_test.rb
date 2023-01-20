class AddCreatorIdToTest < ActiveRecord::Migration[6.0]
  def change
    add_reference :tests, :creator, foreign_key: { to_table: :users }, null: false
  end
end
