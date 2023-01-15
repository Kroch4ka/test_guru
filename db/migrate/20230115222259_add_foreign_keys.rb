class AddForeignKeys < ActiveRecord::Migration[6.0]
  def change
    add_reference :tests, :category, null: false, foreign_key: true
    add_reference :questions, :test, null: false, foreign_key: true
    add_reference :answers, :test, null: false, foreign_key: true
    add_reference :answers, :user, null: false, foreign_key: true
  end
end
