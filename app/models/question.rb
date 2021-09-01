class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :body, presence: true
  validate :answers_count_control

  def answers_count_control
    errors.add(:answers, "У вопроса должно быть от 1 до 4 вариантов ответа") if
      self.answers.size < 1 || self.answers.size > 4
  end
end
