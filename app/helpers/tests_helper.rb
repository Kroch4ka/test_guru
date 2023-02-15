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
      link_to t('test.actions.start'), start_test_url(test), method: :post, class: "button is-link is-light"
    else
      link_to t('test.actions.continue'), continue_test_url(test), method: :post, class: "button is-link is-light"
    end
  end

  def sort_select
    order_options = {
      t('tests.sort_types.title_asc') => 'title_asc',
      t('tests.sort_types.title_desc') => 'title_desc'
    }

    label_tag('sort', t('sort')) +
    content_tag(:div, class: 'select') do
      select_tag('sort', options_for_select(order_options, params[:order]))
    end
  end
end
