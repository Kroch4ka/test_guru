class Answer < ApplicationRecord
  belongs_to :question
  has_and_belongs_to_many :users

  validates :body, presence: true

  scope :correct, -> { where(correct: true) }
end
