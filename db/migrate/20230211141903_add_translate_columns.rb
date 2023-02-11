class AddTranslateColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :answers, :body
    add_column :answers, :body_ru, :text, null: false
    add_column :answers, :body_en, :text

    remove_column :categories , :name
    add_column :categories, :name_ru, :string, null: false
    add_column :categories, :name_en, :string

    remove_column :questions, :body
    add_column :questions, :body_ru, :text, null: false
    add_column :questions, :body_en, :text

    remove_index :tests, [:title, :level]

    remove_column :tests, :title
    add_column :tests, :title_ru, :string, null: false
    add_column :tests, :title_en, :string

    add_index :tests, [:level, :title_ru, :title_en], unique: true
  end
end
