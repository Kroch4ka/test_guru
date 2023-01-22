class Question < ApplicationRecord
  MAX_ANSWERS_COUNT = 4

  belongs_to :test
  has_many :answers

  validates :body, presence: true
end