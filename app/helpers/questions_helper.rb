module QuestionsHelper
  def question_form_header(question)
    question_title = question.test.title
    question.persisted? ? "Edit #{question_title} Question" : "Create New #{question_title} Question"
  end
end