class PostsController < ApplicationController
    
    def index
        @posts = Post.order('created_at DESC')
      end

    def new 
        @post = Post.new 
    end

    def create 
        @post = Post.new(post_only)
        
        if @post.save 
            binding.pry
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
        params.require(:post).permit(:photo, :photo_cache, {photo: []})
    end 

    def set_post
        @post = Post.find(params[:id])
    end

end 
