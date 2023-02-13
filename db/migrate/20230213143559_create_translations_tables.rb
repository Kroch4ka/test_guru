class CreateTranslationsTables < ActiveRecord::Migration[6.0]
  def change
    reversible do |dir|
      dir.up do
        Category.create_translation_table! :name =>  {:type => :string, :null => false }
        Question.create_translation_table! :body => {:type => :text, :null => false }
        Test.create_translation_table! :title => {:type => :string, :null => false }
        Answer.create_translation_table! :body => {:type => :text, :null => false }
      end

      dir.down do
        Category.drop_translation_table!
        Question.drop_translation_table!
        Test.drop_translation_table!
        Answer.drop_translation_table!
      end
    end
  end
end
