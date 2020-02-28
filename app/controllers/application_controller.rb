class ApplicationController < ActionController::Base
# before_action :authenticate_user!


  protected

  def after_sign_in_path_for(resource)
  	if current_user
  	user_path(@user.id)
  else
  end
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
