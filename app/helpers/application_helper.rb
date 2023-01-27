module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to 'Github', "https://github.com/#{author}/#{repo}", class: 'link'
  end
end
