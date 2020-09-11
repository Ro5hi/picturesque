class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:index, :new, :create, :show, :destroy]
    
    def index
        @posts = Post.order("created_at DESC")
      end

    def new 
        @post = Post.new 
    end

    def create
        @post = Post.new(post_only)
        @post.user_id = current_user.id if user_signed_in?
      
        if @post.save
            redirect_to feed_path, flash: { success: "Upload successful." }
        else 
            redirect_to new_post_path, flash: { danger: "Upload failed." }
        end 
    end 

    def show 
    end 

    def update
        if @post.update_attributes(post_params)
          redirect_to post_path(@post)
        else
          render :edit
        end
    end

    private 

    def post_only
        params.require(:post).permit(:photo, :photo_cache, {photo: []}, :user_id)
    end 

    def set_post
        @post = Post.find(params[:id])
    end 
 
    # def user_post
    #     @user = current_user
    #     user_post = Post.find_by(params[:user_id])
    #     posts = current_user.posts
    #     post = current_user.posts.build
    # end 

end 