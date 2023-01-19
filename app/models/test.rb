class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_and_belongs_to_many :users

  def self.titles_by_category_name(category_name)
    Test.joins(:category).where("categories.name LIKE ?", "%#{category_name}%").order(title: :desc).pluck(:title)
  end
end
