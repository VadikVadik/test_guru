module TestPassagesHelper

  def print_result(test_passage)
    all_questions = test_passage.test.questions.count
    correct_questions = test_passage.correct_questions
    result = (correct_questions.to_f / all_questions) * 100.0
    result.round
  end

  def current_question_number(test_passage)
    questions = test_passage.test.questions.pluck(:body)
    current_question = test_passage.current_question.body
    questions.index(current_question) + 1
  end

end
