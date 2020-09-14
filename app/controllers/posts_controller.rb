class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit]

    def index 
        @posts = Post.order("created_at DESC")
    end

    def new 
        @post = Post.new
    end

    def create
        @post = current_user.posts.build(create_params)
        if @post.save
            redirect_to posts_path, notice: { success: "Upload successful." }
        else 
            redirect_to new_post_path, notice: { danger: "Upload failed." }
        end 
    end 

    def show
        # @user = User.find_by(username: params[:username])
        # @post = Post.find_by(params[:id])
    end 

    def edit
        # @post = Post.find(params[:id])
    end 

    def update
        @user = User.find_by(params[:id])

        if @post.update(edit_params)
            redirect_to posts_path(@post)
        else
            redirect_to edit_post_path(@post)
        end 
    end

    def destroy
        post = Post.find_by(id: params[:id]) 

        if @user.post 
            @post.destroy
            redirect_to profile_path, notice: { success: "Post deleted." }
        else 
            redirect_to posts_path, notice: { danger: "No permission." }
        end 
    end

    private

    def create_params 
        params.require(:post).permit(:photo, :photo_cache, :user_id, :caption)
    end

    def edit_params 
        params.require(:post).permit(:caption, :user_id)
    end 

    def set_post
        @post = Post.find_by(id: params[:id])
        # @user = User.find_by(params[:id])
        # @user.photo = Post.where(photo: params[:photo])
    end
end 