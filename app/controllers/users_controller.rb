class UsersController < ApplicationController
    before_action :authenticate_user!

    def index 
        # User feed goes here
        @posts = Post.active
    end 

    def new 
        @user = User.new 
    end 

    def show
        # User profile goes here 
    end 

    

end
