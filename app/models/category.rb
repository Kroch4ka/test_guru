class Category < ApplicationRecord
  default_scope { order(name: :asc) }

  has_many :tests
end
