# frozen_string_literal: true
class Admin::TestsController < Admin::AdminController

  def index
    @tests = current_user.created_tests
  end

  def show
    @test = Test.find(params[:id])
    @questions = @test.questions
  end

  def new
    @test = current_user.created_tests.build
  end

  def create
    @test = current_user.created_tests.build(test_params)
    if @test.save
      redirect_to admin_tests_path, notice: 'Success!'
    else
      render :new
    end
  end

  def edit; end

  def destroy; end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
