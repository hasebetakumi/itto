class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    
    
    before_action :permitted_parameter, if: :devise_controller?
    
    def permitted_parameter
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end
