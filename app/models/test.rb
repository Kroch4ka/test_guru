class Test < ApplicationRecord
  EASY_LEVELS = 0..1
  MEDIUM_LEVELS = 2..4
  HARD_LEVELS = 5..Float::INFINITY

  belongs_to :category
  has_many :questions, dependent: :destroy
  has_and_belongs_to_many :users
  belongs_to :creator, class_name: :User

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true }

  scope :easy, -> { where(level: EASY_LEVELS) }
  scope :medium, -> { where(level: MEDIUM_LEVELS) }
  scope :hard, -> { where(level: HARD_LEVELS) }
  scope :with_categories_by_name, lambda { |category_name|
                                    joins(:category).where('categories.name LIKE ?', "%#{category_name}%")
                                  }

  def self.category_titles(category_name)
    with_categories_by_name(category_name).order(title: :desc).pluck(:title)
  end
end
