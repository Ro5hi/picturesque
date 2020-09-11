class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:index, :new, :create, :show, :destroy]
    
    def show
        # User profile goes here 
    end 

    def index
        @posts = Post.active
    end 

end
