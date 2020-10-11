class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  add_flash_types :success, :info, :warning, :danger
  before_action :set_search_post

  def set_search_post
    @search = Post.ransack(params[:q])
    @posts = @search.result
  end

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

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name birthday postal_code])
  end
end
