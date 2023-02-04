class TestsController < ApplicationController
  before_action :set_test, only: %i[start show]

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end
  
  def start
    test_passage = TestPassage.create(test_id: @test.id, user_id: @user.id)

    redirect_to test_passage_url(test_passage)
  end

  def continue
    test_passage = TestPassage.from_oldest_to_newest_by_test_id(params[:id]).last

    redirect_to test_passage_url(test_passage)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end
end
