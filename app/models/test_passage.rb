class TestPassage < ApplicationRecord
  TEST_PASS_THRESHOLD_PERCENT = 85.freeze

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: :Question, optional: true

  before_validation :set_start_question, on: :create

  scope :by_test_id, ->(test_id) { where(test_id: test_id) }
  scope :from_oldest_to_newest_by_test_id, ->(test_id) { by_test_id(test_id).order(created_at: :asc) }

  def self.newest_by_test_id(test_id)
    from_oldest_to_newest_by_test_id(test_id).last
  end

  def finished?
    current_question.nil?
  end

  def result_in_percent
    (count_correct_questions * 100).to_f / test.questions.size
  end

  def passed?
    result_in_percent >= TEST_PASS_THRESHOLD_PERCENT
  end

  def min_questions_for_passing_test
    ((test.questions.size * TEST_PASS_THRESHOLD_PERCENT).to_f / 100).ceil
  end

  def correct_answers?(answer_ids)
    current_question.answers.correct.ids.sort == answer_ids.map(&:to_i).sort
  end

  def next_question
    test.questions.order(id: :asc).where("id > ?", current_question.id).last
  end

  private

  def set_start_question
    self.current_question = test.questions.first
  end
end
