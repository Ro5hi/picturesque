class UsersController < ApplicationController
    before_action :authenticate_user!

    def new 
        @user = User.new 
    end 

    def show
        # User profile goes here 
    end 

    def index
        @posts = Post.active
    end 

    

end
