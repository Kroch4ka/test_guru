class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, foreign_key: :creator_id, class_name: :Test

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def passed_tests(level)
    tests.where(level: level)
  end

  def admin?
    is_a? Admin
  end
end
