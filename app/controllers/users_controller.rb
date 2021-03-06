class UsersController < ApplicationController

    before_action :set_profile, only: [:show]

    def show
        photo = params[:photo]
    end  

    def index
        @posts = Post.active.order("created_at DESC")
    end

    def edit
        redirect_to edit_user_registration_path 
    end 

    private 

    def set_profile
        @user = User.find_by_username(params[:username])
    end


end 
