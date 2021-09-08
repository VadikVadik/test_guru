class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :answers_count_control

  def answers_count_control
    errors.add(:question_id, "A question cannot have more than 4 possible answers") if
      self.question.answers.size > 4
  end
end
