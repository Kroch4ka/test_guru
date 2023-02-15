class SortTests
  include Interactor

  def call
    order = context.order || 'title_asc'
    case order
    when 'title_asc' then context.tests = Test.all.order(title: :asc)
    when 'title_desc' then context.tests = Test.all.order(title: :desc)
    else context.tests = Test.all
    end
  end
end
