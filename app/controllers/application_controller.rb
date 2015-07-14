class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :configure_devise_permitted_parameters, if: :devise_controller?


  def deny_non_admin
    if current_user and current_user.admin != true
      redirect_to root_path, notice: "You were dienied access"
    end
  end


  protected
  def configure_devise_permitted_parameters
    registration_params = [:firstName, :lastName, :image, :description, :email, :password, :password_confirmation, :admin]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(registration_params << :current_password)
    }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    end
  end
end
