class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_next_question

  POSITIVE_RESULT = 85

  def completed?
    current_question.nil?
  end

  def success?
    result >= POSITIVE_RESULT && !time_out?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
      self.success = true if success?
    end

    save
  end

  def result
    (correct_questions.to_f / test.questions.count * 100).round
  end

  def current_question_number
    test.questions.order(:id).index(current_question) + 1
  end

  def set_time_out
    (created_at.to_datetime + test.duration.minutes).to_i
  end

  def time_out?
    (set_time_out - DateTime.now.to_i) <= 1
  end

  private

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_update_set_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

end
