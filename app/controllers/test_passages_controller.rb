class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[ show result update gist ]

  def show

  end

  def result
    badges = BadgeIssuingService.new(current_user, @test_passage)
    badges.call
    @new_badges = badges.issued
  end

  def update

    @test_passage.accept!(params[:answer_ids]) unless params[:answer_ids].nil?

    if @test_passage.time_out?
      redirect_to result_test_passage_path(@test_passage)
      return
    end

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question)
    result.call

    if result.success?
      current_user.gists.create(question_id: @test_passage.current_question[:id], url: result.get_gist_url)
      flash_options = { notice: t('.success', url: result.get_gist_url) }
    else
      flash_options = { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
