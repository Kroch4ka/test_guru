# frozen_string_literal: true

class TestPassageProgressService < ApplicationService

  def initialize(params)
    @answers = params[:answers]
    @test_passage = params[:test_passage]
  end
  def call
    set_next_question
    OpenStruct.new({ success?: true })
  rescue
    OpenStruct.new({ success?: false })
  end

  private

  attr_reader :answers, :test_passage

  def set_next_question
    if test_passage.correct_answers? answers
      self.test_passage.current_question = test_passage.next_question
      self.test_passage.count_correct_questions += 1
      self.test_passage.save!
    end
  end
end
