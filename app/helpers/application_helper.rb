module ApplicationHelper
  def form_error_field_prompt(resource, field)
    resource.errors[field].map { |message| content_tag(:p, message, class: 'help is-danger') }.join.html_safe
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
    flash.map do |type, message|
      case type
      when 'alert' then content_tag(:div, message, class: 'notification is-danger')
      else content_tag(:div, message, class: 'notification is-primary')
      end
    end.join.html_safe
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
    ([] << link_to(t('.admin'), admin_tests_path) << link_to('Gists', admin_gists_path)).join.html_safe if user_signed_in?
  end
end
