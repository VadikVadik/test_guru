class TestsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_test, only: %i[ show edit update start ]
  before_action :set_user, only: :start
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def show

  end

  def edit

  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to tests_path
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to tests_path
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def start
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def set_user
    @user = User.find(session[:user_id])
  end

  def rescue_with_test_not_found
    render html: '<h1>Test not found</h1>'.html_safe
  end

end
