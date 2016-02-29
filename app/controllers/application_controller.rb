class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

 def admin_only
 	unless current_user && current_user.role == "admin"
 		flash[:access_denied] = "Access DENIED. You must be an admin to see this page."
 		redirect_to new_user_registration_path
 	end
 end

# only ask for location once during session
 def lat_lng
  @lat_lng ||= session[:lat_lng]
 end

  protected
  	def configure_permitted_parameters
  		devise_parameter_sanitizer.for(:sign_up).push :first_name, :last_name, :bio, :birthday
  		devise_parameter_sanitizer.for(:account_update).push :first_name, :last_name, :bio, :birthday
  	end
end
