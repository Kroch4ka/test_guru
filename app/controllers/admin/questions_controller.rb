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
      redirect_to @question.test
    else
      redirect_to :edit
    end
  end

  def create
    question = @test.questions.build(question_params)

    if question.save
      redirect_to @test
    else
      redirect_to new_admin_test_question_path(@test), alert: 'Упс, вопрос не был создан!'
    end
  end

  def destroy
    redirect_to @question.test if @question.destroy
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
    render plain: '404 Не найдено!', status: :not_found
  end
end
