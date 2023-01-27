module TestsHelper

  def levelize(level)
    case level
    when Test::EASY_LEVELS then 'Лёгкий'
    when Test::MEDIUM_LEVELS then 'Средний'
    when Test::HARD_LEVELS then 'Тяжёлый'
    else 'Некорректный('
    end
  end
end
