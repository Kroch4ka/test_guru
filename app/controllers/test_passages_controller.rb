class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage

  def show; end

  def result; end

  def update
    pass_test_interaction = PassTest.call({ answer_ids: [*params[:answer_ids]], test_passage: @test_passage })

    if pass_test_interaction.failure?
      return redirect_to test_passage_url(@test_passage), alert: pass_test_interaction.error
    end

    if pass_test_interaction.finished
      redirect_to result_test_passage_url(@test_passage)
    else
      redirect_to test_passage_url(@test_passage)
    end
  end

  def gist
    return redirect_to(test_passage_path(@test_passage), alert: t('.alerts.already_created')) if current_user.has_gist?(@test_passage.current_question)

    create_gist_interaction = CreateQuestionGist.call(question: @test_passage.current_question)
    return redirect_to(test_passage_path(@test_passage), alert: create_gist_interaction.error) if create_gist_interaction.failure?

    gist = create_gist_interaction.gist
    if Gist.create(question_id: @test_passage.current_question.id, user_id: current_user.id, gist_url: gist.html_url)
      redirect_to test_passage_path(@test_passage), notice: t('.notice.success_created_html', gist_url: gist.html_url)
    else
      redirect_to test_passage_path(@test_passage), alert: t('.alerts.db_error')
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
