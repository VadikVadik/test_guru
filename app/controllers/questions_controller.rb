class QuestionsController < ApplicationController

  before_action :find_test, only: [:index, :create, :new]
  before_action :find_question, only: [:edit, :show, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    redirect_to @test
  end

  def show

  end

  def new
    @question = Question.new
  end

  def create
    question = @test.questions.new(question_params)

    if question.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    @question.update(question_params)
    redirect_to test_questions_path(@question.test)
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path(@question.test)
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render html: '<h1>Question not found</h1>'.html_safe
  end

end
