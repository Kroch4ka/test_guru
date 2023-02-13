class RemoveTranslateColumns < ActiveRecord::Migration[6.0]
  def change
    remove_index :tests, [:level, :title_ru, :title_en]

    remove_column :answers, :body_ru
    remove_column :answers, :body_en

    remove_column :categories, :name_ru
    remove_column :categories, :name_en

    remove_column :questions, :body_ru
    remove_column :questions, :body_en

    remove_column :tests, :title_ru
    remove_column :tests, :title_en
  end
end
