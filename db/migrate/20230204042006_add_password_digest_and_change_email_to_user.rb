class AddPasswordDigestAndChangeEmailToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :password_digest, :text, null: false
    change_column :users, :email, :string, null: false
    add_index :users, :email, unique: true
  end
end
