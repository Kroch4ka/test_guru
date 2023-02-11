class Category < ApplicationRecord
  default_scope { order(self.current_locale_column(:name) => :asc) }

  translates :name

  has_many :tests, dependent: :destroy
end