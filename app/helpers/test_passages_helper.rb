module TestPassagesHelper
  def count_correct_questions(test_passage)
    message = "#{test_passage.count_correct_questions} #{t('from')} #{test_passage.test.questions.size}"
    content_tag(:span, message)
  end

  def gist_link(question)
    unless current_user.has_gist?(question)
      link_to 'Создать Gist', gist_test_passage_path(@test_passage), method: :post, class: 'button is-link'
    end
  end
end
