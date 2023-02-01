class TestsController < ApplicationController
  before_action :set_user, only: %i[start]

  def index
    @tests = Test.all
  end

  def show
    @questions = Test.find(params[:id]).questions
  end
  
  def start
    test_passage = TestPassage.create(user_id: @user.id, test_id: params[:id])

    redirect_to test_passage_url(test_passage)
  end

  def continue
    test_passage = TestPassage.from_oldest_to_newest_by_test_id(params[:id]).last

    redirect_to test_passage_url(test_passage)
  end

  private

  def set_user
    @user = User.all.order(id: :asc).first
  end
end
