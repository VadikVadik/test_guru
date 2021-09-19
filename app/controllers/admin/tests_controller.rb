class Admin::TestsController < Admin::BaseController

  before_action :find_test, only: %i[ show edit update destroy ]
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
    current_user.created_tests.push(@test)
    if @test.save
      redirect_to admin_tests_path, notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_tests_path, notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path, notice: t('.success')
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    render html: '<h1>Test not found</h1>'.html_safe
  end

end
