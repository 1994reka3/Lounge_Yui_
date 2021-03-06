class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  add_flash_types :success, :info, :warning, :danger


  protected

  def after_sign_in_path_for(resource)
    case resource
    when EndUser
      posts_path
    when Admin
      admins_top_path
    end
  end

  def after_sign_up_path_for(resource)
    case resource
    when EndUser
      posts_path
    when Admin
      admins_top_path
    end
  end

  def after_sign_out_path_for(resource)
    if resource == :admin
      new_admin_session_path
    elsif
      resource == :end_user
      root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name birthday postal_code])
  end
end
