class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :sign_out_user,  if: :user_signed_in?
    before_action :permitted_parameter, if: :devise_controller?
    
    def permitted_parameter
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
    
    
    protected
    def sign_out_user
      sign_out_and_redirect(current_user) unless current_user.right?
    end
end
