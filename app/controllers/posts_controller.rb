class PostsController < ApplicationController
    before_action :set_post, only: [:index, :new, :create, :edit, :update, :destroy]

    def index 
        @posts = Post.order("created_at DESC")
    end

    def new 
        @post = Post.new(create_params)
    end

    def create
        @post.user_id = current_user.id if user_signed_in?

        if @post.save
            redirect_to posts_path, notice: { success: "Upload successful." }
        else 
            redirect_to new_post_path, notice: { danger: "Upload failed." }
        end 
    end 

    def show 
        @user = User.find_by(params[:id])
        @post = Post.find_by(params[:id])
        @comments = Comment.where(post_id: params[:id])
    end 

    def edit
        @post = Post.find(params[:id])
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
        params.require(:post).permit(:photo, :caption, :user_id)
    end

    def edit_params 
        params.require(:post).permit(:caption, :user_id)
    end 

    def set_post
        @post = Post.where(params[:id])
    end
end 