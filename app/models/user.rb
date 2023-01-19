class User < ApplicationRecord
  has_and_belongs_to_many :tests
  has_and_belongs_to_many :answers

  def passed_tests(level)
    tests.where(level: level)
  end
end
