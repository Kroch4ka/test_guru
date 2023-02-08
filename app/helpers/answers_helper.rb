# frozen_string_literal: true

module AnswersHelper
  def answer_form_heading(answer)
    answer.persisted? ? "Edit Answer" : "Create New Answer"
  end
end
