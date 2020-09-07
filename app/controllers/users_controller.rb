class UsersController < ApplicationController
    before_action :authenticate_user!

    def index 
        # User home goes here
    end 

    def new 
        @user = User.new 
    end 

    def show
        # User profile goes here 
    end 

    

end
