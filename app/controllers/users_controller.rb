class UsersController < ApplicationController

    before_action :set_user, only: [:show]

    def show
        @posts = @user.posts
    end  

    def index
        @posts = Post.active
    end 

    private 

    def set_user 
        @user = User.find_by_username(params[:username])
    end 
    
end 
