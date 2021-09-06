class QuestionsController < ApplicationController

  before_action :find_test, only: [:index, :create, :new]
  before_action :find_question, only: [:edit, :show, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render inline: '<h1>All questions of test: <%= @test.title %></h1>
                    <ol><% @test.questions.pluck(:body).each do |question| -%>
                      <%= content_tag :li, question %>
                    <% end -%></ol>'
  end

  def show
    render inline: '<h1>Test: <%= @question.test.title %></h1>
                    <h3>Question:</h3>
                    <p><%= @question.body %></p>'
  end

  def new
    @question = Question.new
  end

  def create
    question = @test.questions.new(question_params)

    if question.save
      render inline: '<p>Question "<%= params[:question][:body] %>" successfully created</p>'
    else
      render html: '<p>Something went wrong...</p>'
    end
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path
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
