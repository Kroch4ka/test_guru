class Admin::QuestionsController < Admin::AdminController
  before_action :set_test, only: %i[index create new]
  before_action :set_question, only: %i[edit show update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def new
    @question = @test.questions.build
  end

  def show; end

  def update
    if @question.update(question_params)
      redirect_to edit_admin_question_path(@question)
    else
      redirect_to :edit
    end
  end

  def create
    question = @test.questions.build(question_params)

    if question.save
      redirect_to admin_test_path(@test)
    else
      redirect_to new_admin_test_question_path(@test), alert: t('general_error')
    end
  end

  def destroy
    redirect_to admin_test_path(@question.test), notice: t('success') if @question.destroy
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def record_not_found
    render plain: t('network.404'), status: :not_found
  end
end
