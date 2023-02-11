class ApplicationController < ActionController::Base
  include Pundit::Authorization
  before_action :configure_permitted_parameters, if: :devise_controller?
  around_action :switch_locale

  protected

  def default_url_options
    locale_options = I18n.locale == I18n.default_locale ? {} : { locale: I18n.locale }

    {}.merge(locale_options)
  end

  def after_sign_in_path_for(_)
    current_user.admin? ?  admin_tests_path : root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def switch_locale(&action)
    locale = I18n.locale_available?(params[:locale]) ? params[:locale] : I18n.default_locale
    I18n.with_locale(locale, &action)
  end
end
