class Admin::AnswersController < Admin::AdminController
  before_action :set_answer, only: %i[edit update destroy]
  before_action :set_question, only: %i[new create]

  def new
    @answer = @question.answers.build
  end

  def create
    @answer = @question.answers.build(answer_params)

    if @answer.save
      redirect_to edit_admin_question_path(@question)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @answer.update(answer_params)
      redirect_to edit_admin_question_path(@answer.question)
    else
      render :edit
    end
  end

  def destroy
    redirect_to edit_admin_question_path(@answer.question) if @answer.destroy
  end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:body)
  end
end
