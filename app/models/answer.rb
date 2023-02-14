class Answer < ApplicationRecord
  translates :body, fallbacks_for_empty_translations: true

  MAX_ANSWERS_COUNT = 4

  belongs_to :question

  validate :check_for_added_to_question, on: :create
  validates :body, presence: true

  scope :correct, -> { where(correct: true) }

  private

  def check_for_added_to_question
    errors.add(:overflow_answers, "Test can take only #{MAX_ANSWERS_COUNT} answers") if can_not_be_added_to_question?
  end

  def can_not_be_added_to_question?
    MAX_ANSWERS_COUNT < question.answers.size
  end
end
