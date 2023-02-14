class Category < ApplicationRecord
  translates :name, fallbacks_for_empty_translations: true

  default_scope { order(name: :asc) }

  validates :name, presence: true

  has_many :tests, dependent: :destroy
end
