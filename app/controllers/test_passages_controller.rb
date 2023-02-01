class TestPassagesController < ApplicationController
  before_action :set_test_passage
  before_action :set_user

  def update
    answers = [*params[:answer_ids]]
    @test_passage.save! if @test_passage.correct_answers?(answers)

    update_question_redirect @test_passage
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def set_user
    @user = User.all.order(id: :asc).first
  end

  def update_question_redirect(test_passage)
    if test_passage.finished?
      redirect_to result_test_passage_url(test_passage)
    else
      redirect_to test_passage_url(test_passage)
    end
  end
end