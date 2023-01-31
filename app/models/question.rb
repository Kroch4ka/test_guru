class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy

  validates :body, presence: true

  def serial_number
    test.questions.ids.each.with_index { |question_id, index| return index + 1 if question_id == id }
  end

  def last?
    serial_number == test.questions.ids.size
  end
end
