class CreateGists < ActiveRecord::Migration[6.0]
  def change
    create_table :gists do |t|
      t.belongs_to :question, foreign_key: true
      t.string :gist_url
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
