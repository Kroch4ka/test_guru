module ApplicationHelper
  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to 'Github', "https://github.com/#{author}/#{repo}", class: 'link'
  end

  def authenticate_links
    if user_signed_in?
      link_to 'Выйти', destroy_user_session_path, method: :delete, class: 'link'
    else
      [
        link_to('Зарегистрироваться', new_user_registration_path, class: 'link'),
        link_to('Войти', new_user_session_path, class: 'link')
      ].join(' ').html_safe
    end
  end
end
