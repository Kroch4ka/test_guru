module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to 'Github', "https://github.com/#{author}/#{repo}", class: 'link'
  end

  def authenticate_links
    if authenticated?
      link_to 'Выйти', logout_path, method: :post, class: 'link'
    else
      [
        link_to('Зарегистрироваться', signup_path, class: 'link'),
        link_to('Войти', login_path, class: 'link')
      ].join(' ').html_safe
    end
  end

  def logo_link
    link_to 'Test Guru', root_path
  end
end
