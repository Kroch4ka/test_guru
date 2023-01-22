class Question < ApplicationRecord
  ANSWERS_COUNT = 0..4

  private_constant :ANSWERS_COUNT

  belongs_to :test
  has_many :answers

  validates :body, presence: true
  validates :answers, length: ANSWERS_COUNT
end