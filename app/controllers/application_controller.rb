class ApplicationController < ActionController::Base
	include Pundit 
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  #before_action :configure_permitted_parameters, if: :user_controller?
  

  # protected

  # def configure_permitted_parameters
  # 	devise_parameter_sanitizer.permit(:sign_up, keys: [:username] }
  # end

  # private

  # def current_user 
  # 	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end
  # helper_method :current_user

  # def authorize
  # 	redirect_to login_url, alert: "Not Authorized" if current_user.nil?
  # end
end
