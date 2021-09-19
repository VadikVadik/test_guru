class ApplicationController < ActionController::Base

  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  def default_url_options
    { lang: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end

  protected

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:first_name, :last_name])
  end

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_tests_path
    else
      tests_path
    end
  end

end
