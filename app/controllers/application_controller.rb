class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in, :invalid_user

    def index 
        redirect_to root_path
    end 

    def logged_in
        !!current_user
    end 

    def current_user
        @user ||= User.find(session[:user_id])
    end     

    def invalid_user
        if !logged_in 
            redirect_to new_user_session_path
        end 
    end
    
end
