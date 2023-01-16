class Test < ApplicationRecord
  belongs_to :category

  def self.test_titles_by_category_name(category_name)
    Test.joins(:category).where("categories.name LIKE ?", "%#{category_name}%").pluck(:name)
  end
end
