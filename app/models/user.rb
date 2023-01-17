class User < ApplicationRecord
  has_many :answers

  def passed_tests(level)
    Test.where(level: level).joins(questions: :answers).where(answers: { user_id: id }).uniq
  end
end
