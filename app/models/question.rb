class Question < ApplicationRecord
  translates :body, fallbacks_for_empty_translations: true

  belongs_to :test
  has_many :answers, dependent: :destroy
  has_many :gists, dependent: :destroy

  validates :body, presence: true

  def serial_number
    test.questions.find_index(self) + 1
  end

  def last?
    serial_number == test.questions.order(id: :asc).size
  end
end
