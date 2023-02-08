class TestsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tests = Test.all
  end
  
  def start
    test = Test.find(params[:id])
    test_passage = TestPassage.create(test_id: test.id, user_id: current_user.id)

    redirect_to test_passage_url(test_passage)
  end

  def continue
    test_passage = TestPassage.from_oldest_to_newest_by_test_id(params[:id]).last

    redirect_to test_passage_url(test_passage)
  end
end
