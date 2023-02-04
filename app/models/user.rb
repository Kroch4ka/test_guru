class User < ApplicationRecord
  has_secure_password

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, foreign_key: :creator_id, class_name: :Test

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password_digest, presence: true

  before_save :normalize_email

  def passed_tests(level)
    tests.where(level: level)
  end

  def normalize_email
    self.email = email.downcase
  end
end
