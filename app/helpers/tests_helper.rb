module TestsHelper
  def levelize(level)
    case level
    when Test::EASY_LEVELS then t('test.level.easy')
    when Test::MEDIUM_LEVELS then t('test.level.medium')
    when Test::HARD_LEVELS then t('test.level.hard')
    else t('test.level.undefined')
    end
  end

  def link_to_take_test(test)
    test_passage = TestPassage.from_oldest_to_newest_by_test_id(test.id).last

    if !test_passage || test_passage.finished?
      link_to t('test.actions.start'), start_test_url(test), method: :post, class: "link"
    else
      link_to t('test.actions.continue'), continue_test_url(test), method: :post, class: "link"
    end
  end
end
