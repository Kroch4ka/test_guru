class User < ApplicationRecord
  has_many :answers

  def passed_tests(level)
    answers.map { |answer| answer.question.test.level == level ? answer.question.test : nil }.compact
  end
end
