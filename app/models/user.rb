class User < ApplicationRecord
  MIN_PASSWORD_LENGTH = 5
  MAX_PASSWORD_LENGTH = 15

  devise :database_authenticatable, :registerable

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, foreign_key: :creator_id, class_name: :Test
  has_many :gists, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :encrypted_password, presence: true
  validate :validate_password_length

  def passed_tests(level)
    tests.where(level: level)
  end

  def admin?
    is_a?(Admin)
  end

  def has_gist?(question)
    !gists.where(question_id: question.id).empty?
  end

  private

  def validate_password_length
    errors.add(:password, :should_be_between, { min_size: MIN_PASSWORD_LENGTH, max_size: MAX_PASSWORD_LENGTH }) unless not_valid_password?
  end

  def not_valid_password?
    password.size >= MIN_PASSWORD_LENGTH && password.size <= MAX_PASSWORD_LENGTH
  end
end
