class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
        start_page_show_path
    end
    


    private
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_in, keys: [:username,:provider,:uid])
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username,:provider,:uid])
        devise_parameter_sanitizer.permit(:update_account, keys: [:username,:provider,:uid])
    end
    
    
end
