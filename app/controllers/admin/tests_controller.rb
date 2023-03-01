# frozen_string_literal: true
class Admin::TestsController < Admin::AdminController
  before_action :set_test, only: %i[show destroy publish unpublish]

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
      redirect_to admin_tests_path, notice: t('success')
    else
      render :new
    end
  end

  def edit; end

  def publish
    if @test.update(publish: true)
      redirect_to admin_tests_path, notice: t('success')
    else
      redirect_to admin_tests_path, notice: t('general_error')
    end
  end

  def unpublish
    if @test.update(publish: false)
      redirect_to admin_tests_path, notice: t('success')
    else
      redirect_to admin_tests_path, notice: t('general_error')
    end
  end

  def destroy
    redirect_to admin_tests_path, notice: t('success') if @test.destroy!
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :publish, :category_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end
end
