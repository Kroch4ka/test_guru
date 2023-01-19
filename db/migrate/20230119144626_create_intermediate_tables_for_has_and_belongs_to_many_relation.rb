class CreateIntermediateTablesForHasAndBelongsToManyRelation < ActiveRecord::Migration[6.0]
  def change
    create_table :answers_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :answer
    end

    create_table :tests_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :test
    end
  end
end
