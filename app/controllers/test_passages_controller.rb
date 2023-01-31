class TestPassagesController < ApplicationController
  before_action :set_test_passage

  def answer
    answers = [*params[:answer_ids]]
    if @test_passage.correct_answers?(answers)
      @test_passage.send(:set_next_question)
      @test_passage.save!
    end

    if @test_passage.finished?
      redirect_to result_test_passage_url(@test_passage)
    else
      redirect_to test_passage_url(@test_passage)
    end
  end

  def retry
    created_test_passage = nil

    if @test_passage.id != TestPassage.newest_by_test_id(@test_passage.test.id).id
      created_test_passage = TestPassage.newest_by_test_id(@test_passage.test.id)
    else
      created_test_passage = TestPassage.create(user_id: @user.id, test_id: @test_passage.test.id)
    end

    redirect_to test_passage_url(created_test_passage)
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end