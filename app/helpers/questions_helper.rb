module QuestionsHelper

  def question_header(test, question)
    if question.new_record?
      return "Create New #{test.title} Question"
    else
      return "Edit #{question.test.title} Question"
    end
  end

end
