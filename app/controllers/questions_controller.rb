class QuestionsController < ApplicationController

  before_action :find_test

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render inline: '<h1>All questions of test: <%= @test.title %></h1>
                    <ol><% @test.questions.pluck(:body).each do |question| -%>
                      <%= content_tag :li, question %>
                    <% end -%></ol>'
  end

  def show
    render inline: '<h1>Test: <%= @test.title %></h1>
                    <h3>Question №<%= params[:id].to_i %>:</h3>
                    <p><%= Question.find(params[:id]).body %></p>'
  end

  def new

  end

  def create
    question = @test.questions.create(question_params)

    render inline: '<p>Question "<%= params[:body] %>" successfully created</p>'
  end

  def destroy
    Question.find(params[:id]).destroy_all
    redirect_to test_questions_path
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render html: '<h1>Question not found</h1>'.html_safe
  end

end
