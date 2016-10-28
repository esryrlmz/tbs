class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  # Includes Authorization mechanism
  include Pundit
 
  protect_from_forgery with: :exception
 
  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  protected

    def configure_devise_permitted_parameters
      registration_params = [:email, :password, :password_confirmation]

      if params[:action] == 'update'
        devise_parameter_sanitizer.for(:account_update) { 
          |u| u.permit(registration_params << :current_password, :image, :is_passive)
        }
      elsif params[:action] == 'create'
        devise_parameter_sanitizer.for(:sign_up) { 
          |u| u.permit(registration_params) 
        }
      end
    end

    def after_sign_in_path_for(resource)
      URI.parse(request.referer).path if request.referer
    end

    def after_sign_out_path_for(resource_or_scope)
      URI.parse(request.referer).path if request.referer
    end


    ### Pundit

    rescue_from Pundit::NotAuthorizedError, with: :permission_denied
   
    def permission_denied
      render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
    end
end
