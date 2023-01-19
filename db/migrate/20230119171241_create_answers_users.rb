class CreateAnswersUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :answer
    end
  end
end
