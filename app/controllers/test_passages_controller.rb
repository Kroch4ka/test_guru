class TestPassagesController < ApplicationController
  before_action :set_test_passage

  def show; end

  def result; end

  def update
    pass_test_interactor = PassTest.call({ answer_ids: [*params[:answer_ids]], test_passage: @test_passage })

    if pass_test_interactor.failure?
      return redirect_to test_passage_url(@test_passage), alert: pass_test_interactor.error
    end

    if pass_test_interactor.finished
      redirect_to result_test_passage_url(@test_passage)
    else
      redirect_to test_passage_url(@test_passage)
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
