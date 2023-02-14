class Test < ApplicationRecord
  translates :title, fallbacks_for_empty_translations: true

  EASY_LEVELS = 0..1
  MEDIUM_LEVELS = 2..4
  HARD_LEVELS = 5..Float::INFINITY

  has_many :users, through: :test_passages
  belongs_to :category
  has_many :questions, dependent: :destroy
  belongs_to :creator, foreign_key: :creator_id, class_name: :User

  validates :level, numericality: { only_integer: true }
  validates :title, presence: true

  scope :easy, -> { where(level: EASY_LEVELS) }
  scope :medium, -> { where(level: MEDIUM_LEVELS) }
  scope :hard, -> { where(level: HARD_LEVELS) }
  scope :with_categories_by_name, ->(category_name) { joins(:category).where('? LIKE ?', "categoires.#{Category.current_locale_column(:name)}", "%#{category_name}%") }

  def self.category_titles(category_name)
    title_column = current_locale_column(:title)
    with_categories_by_name(category_name).order(title_column => :desc).pluck(title_column)
  end
end
