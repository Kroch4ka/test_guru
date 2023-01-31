class TestPassage < ApplicationRecord
  TEST_PASS_THRESHOLD_PERCENT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: :Question, optional: true

  before_validation :set_start_question, on: :create

  scope :from_oldest_to_newest_by_test_id, ->(test_id) { where(test_id: test_id).order(created_at: :asc) }

  def self.not_exists?(test_id)
    from_oldest_to_newest_by_test_id(test_id).empty?
  end

  def self.newest_by_test_id(test_id)
    from_oldest_to_newest_by_test_id(test_id).last
  end

  def correct_answers?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def test_questions
    test.questions.order(id: :asc)
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

  def minimum_questions_for_passing_test
    (test.questions.size / TEST_PASS_THRESHOLD_PERCENT) * 100
  end

  private

  def set_next_question
    self.current_question = next_question
    self.count_correct_questions += 1
  end

  def next_question
    test.questions.order(id: :asc).where("id > ?", current_question.id).last
  end

  def set_start_question
    self.current_question = test_questions.first
  end

  def correct_answers
    current_question.answers.correct
  end
end
