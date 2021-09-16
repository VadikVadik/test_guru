class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:first_name, :last_name])
  end

  def after_sign_in_path_for(resource)
    if resource.class == Admin
      admin_tests_path
    elsif resource.class == User
      tests_path
    end
  end

end
