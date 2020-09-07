class PostsController < ApplicationController
    
    def new 
        @post = Post.new 
    end

    def create 
        @post = Post.new(post_only)

        if @post.save 
            redirect_to feed_path, flash: { success: "Upload successful." }
        else 
            redirect_to new_post_path, flash: { danger: "Upload failed." }
        end 
    end 

    def show 
        @posts = Post.active
    end 

    private 

    def post_only
        params.require(:post).permit(:photo, :photo_cache) 
    end 

end 
