class ApplicationController < ActionController::Base
	  before_action :configure_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # rescue_from CanCan::AccessDenied do |exception|
  #   flash[:error] = "Access denied!"
  #   redirect_to root_url
  # end

  protected
  def configure_permitted_parameters
devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
devise_parameter_sanitizer.permit(:account_update, keys: [:name])
end
rescue_from CanCan::AccessDenied do |exception|
  flash[:error] = "Access denied!"
  redirect_to root_url
end
# private 
def current_ability
  @current_ability ||= Ability.new(current) 
  if admin_signed_in?
      @current_ability ||= Ability.new(current_admin)
    else
      @current_ability ||= Ability.new(current_user)
  end 
end


end
