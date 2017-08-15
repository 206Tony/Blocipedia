class ApplicationController < ActionController::Base
	include Pundit 
  
  protect_from_forgery with: :exception
  
  before_action :authenticate_user!
  
  # before_action :configure_permitted_parameters, if: :devise_controller?
  
  # rescue_from Pundit::NotAuthorizedError do |exception|
  #   flash[:error] = "You have to sign in to add changes to wikis."
  #   redirect_to root_url
  # end
  
  # protected

  # def configure_permitted_parameters
  # 	devise_parameter_sanitizer.for(:sign_up) << :name 
  # end

end
