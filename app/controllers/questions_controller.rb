class QuestionsController < ApplicationController
  before_action :get_test, only: %i[index create new]
  before_action :get_question, only: %i[edit, show, update, destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @questions = @test.questions
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    question = @test.questions.build(question_params)

    if question.save
      render :inline => "<h1>Вопрос был успешно создан!</h1>"
    else
      redirect_to new_test_question_path(@test), :alert => "Упс, вопрос не был создан!"
    end
  end

  def destroy
    if @question.destroy
      render :inline => "<h1>Вопрос был успешно удалён</h1>"
    end
  end

  private

  def get_test
    @test = Test.find(params[:test_id])
  end

  def get_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def record_not_found
    render plain: "404 Не найдено!", status: 404
  end
end
