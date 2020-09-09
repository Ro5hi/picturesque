class UsersController < ApplicationController
    before_action :authenticate_user!

    def new 
        @user = User.new 
    end 

    def show
        # User profile goes here 
    end 

    def index
        # User personal feed goes here 
    end 

    

end
