class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    def index 
        @posts = Post.order("created_at DESC")
    end

    def new 
        @post = Post.new
    end

    def create
        @post = current_user.posts.build(create_params)
        if @post.save
            redirect_to posts_path(@post), notice: "Posted."
        else
            redirect_to new_post_path, notice: "Failed."
        end 
    end 

    def show
        binding.pry
    end  

    def edit
    end 

    def update
        if @post.user_id == current_user.id
           @post.update(edit_params)
           flash[:notice] = "Post updated."
           redirect_to posts_path(@post)
        else
            flash[:notice] = "No permission to edit."
           redirect_to posts_path
        end 
    end

    def destroy
        if @post.user_id == current_user.id
           @post.destroy
           flash[:notice] = "Post deleted."
           redirect_to posts_path
        else 
           flash[:notice] = "No permission to delete."
           redirect_to posts_path
        end 
    end

    private

    def create_params 
        params.require(:post).permit(:photo, :photo_cache, :user_id, :caption, :tag_list)
    end

    def edit_params 
        params.require(:post).permit(:caption, :tag_list, :user_id, :id)
    end

    def set_post
        @post = Post.find_by(id: params[:id])
    end
    
end 