class UsersController < ApplicationController

    before_action :set_profile, only: [:show]
    before_action :set_posts, only: [:show]

    def show
    end  

    def index
        @posts = Post.active.order("created_at DESC")
    end 

    private 

    def set_profile
        @user = User.find_by_username(params[:username])
    end

    def set_posts 
        @posts = @user.posts
    end 

end 
