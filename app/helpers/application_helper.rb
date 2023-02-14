module ApplicationHelper
  def form_error_field_prompt(resource, field)
    result = []
    if resource.errors[field]
      resource.errors[field].each do |message|
        result << content_tag(:p, message, class: 'help is-danger')
      end
    end
    result.join('\n').html_safe
  end

  def greet_user
    if user_signed_in?
      "<article class='message greeting-message is-primary'>
        <div class='message-body'>
          #{t('greeting', name: current_user.name)}
        </div>
       </article>".html_safe
    end
  end

  def flash_by_type(flash)
    result = []
    flash.each do |type, message|
      case type
      when 'alert' then result << content_tag(:div, message, class: 'notification is-danger')
      else result << content_tag(:div, message, class: 'notification is-primary')
      end
    end

    result.join('\n').html_safe
  end

  def form_heading(resource_instance)
    model_name = resource_instance.class.model_name.human
    if resource_instance.persisted?
      content_tag(:div, t('helpers.submit.edit', model: model_name), class: 'subtitle')
    else
      content_tag(:div, t('helpers.submit.create', model: model_name), class: 'subtitle')
    end
  end

  def current_year
    Date.current.year
  end

  def github_url(author, repo)
    link_to 'Github', "https://github.com/#{author}/#{repo}", class: 'link'
  end

  def authenticate_links
    if user_signed_in?
      link_to(t('users.shared.links.sign_out'), destroy_user_session_path, method: :delete, class: 'link')
    else
      [
        link_to(t('users.shared.links.sign_up'), new_user_registration_path, class: 'link'),
        link_to(t('users.shared.links.sign_in'), new_user_session_path, class: 'link')
      ].join(' ').html_safe
    end
  end

  def admin_links
    result = []
    if user_signed_in?
      result << link_to(t('.admin'), admin_tests_path)
      result << link_to('Gists', admin_gists_path)
    end
    result.join.html_safe
  end
end
