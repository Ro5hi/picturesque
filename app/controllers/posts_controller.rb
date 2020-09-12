class PostsController < ApplicationController

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
        @user = current_user
        @post = Post.find_by(params[:id])
        @comments = Comment.where(post_id: params[:id])
    end 

    def update
        if @post.update_attributes(post_only)
          redirect_to post_path(@post)
        else
          render :edit
        end
    end

    def destroy 
        if @post = Post.find_by(id: params[:id])
            @post.destroy
        else 
            redirect_to feed_path
        end 
    end  

    private 

    def post_only
        params.require(:post).permit(:photo, :photo_cache, :caption, :user_id)
    end 

    def set_post
        @post = Post.where(params[:id])
    end 
end 