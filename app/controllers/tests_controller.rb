class TestsController < ApplicationController
  skip_forgery_protection

  before_action :set_test, only: %i[show]

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end
  
  def start
    test_passage = nil

    if TestPassage.not_exists?(params[:id])
      test_passage = TestPassage.create(user_id: @user.id, test_id: params[:id])
    else
      test_passage = TestPassage.from_oldest_to_newest_by_test_id(params[:id]).last
    end

    if test_passage.finished? 
      redirect_to(result_test_passage_url(test_passage))
    else
      redirect_to(test_passage_url(test_passage))
    end
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end
end
