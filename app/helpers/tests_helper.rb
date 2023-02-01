module TestsHelper
  def levelize(level)
    case level
    when Test::EASY_LEVELS then 'Лёгкий'
    when Test::MEDIUM_LEVELS then 'Средний'
    when Test::HARD_LEVELS then 'Тяжёлый'
    else 'Некорректный('
    end
  end

  def link_to_take_test(test)
    test_passage = TestPassage.from_oldest_to_newest_by_test_id(test.id).last

    if !test_passage || test_passage.finished?
      link_to 'Начать', start_test_url(test), method: :post, class: "link"
    else
      link_to 'Продолжить', continue_test_url(test), method: :post, class: "link"
    end
  end
end
