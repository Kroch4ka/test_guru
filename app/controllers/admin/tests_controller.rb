# frozen_string_literal: true
class Admin::TestsController < Admin::AdminController
  before_action :set_test, except: %i[index create]

  def index
    @tests = current_user.created_tests
  end

  def show
    @questions = @test.questions
  end

  def new
    @test = Test.new(creator_id: current_user.id)
  end

  def edit; end

  def destroy; end

  private

  def set_test
    @test = Test.find(params[:id])
  end
end
