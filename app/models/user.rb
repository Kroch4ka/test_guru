class User < ApplicationRecord
  has_and_belongs_to_many :tests
  has_and_belongs_to_many :answers
  has_many :created_tests, foreign_key: :creator_id, class_name: :Test

  def passed_tests(level)
    tests.where(level: level)
  end
end
