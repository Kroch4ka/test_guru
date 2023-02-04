class PassTest
  include Interactor

  def call
    test_passage, answer_ids = context.test_passage, context.answer_ids

    if test_passage.correct_answers?(answer_ids)
      test_passage.count_correct_questions += 1
    end

    test_passage.current_question = test_passage.next_question
    context.finished = test_passage.finished?

    test_passage.save!
  rescue
    context.fail!(error: 'Что-то пошло не так в процессе прохождения теста')
  end
end
