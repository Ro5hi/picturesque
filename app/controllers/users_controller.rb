class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:index, :new, :create, :show, :destroy]
    before_action :set_user, only: [:show]

    def show
        # User profile goes here 
        posts = @user.posts.active
    end 

    def index
        @posts = Post.active
    end 

    def user_posts
    end 

    def update 
    end 

    private 

    def set_user 
        @user = User.find_by_username(params[:username])
    end 

end
