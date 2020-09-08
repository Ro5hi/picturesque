class Users::OmniauthController < Devise::OmniauthController

    def twitter 
      @user = User.from_omniauth(request.env["omniauth.auth"])

      if @user.persisted? 
        sign_in_and_redirect @user, event: :authentication
      else 
        session["devise.twitter_data"] = request.env["omniauth.auth"].except("extra")
        redirect_to new_user_registration_path
      end
    end
      
    def failure
      redirect_to root_path
    end

    protected 

    def auth_hash
      request.env['omniauth.auth']  
    end 

end 