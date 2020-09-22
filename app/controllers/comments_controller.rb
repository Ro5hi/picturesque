class CommentsController < ApplicationController    

    before_action :get_post, only: [:show]

    def new
        @comment = Comment.new
        @user = current_user
        @post = Post.find_by(id: params[:id])
    end

    def show 
    end 

    def create
        binding.pry
        @comment = current_user.comments.build(comment_params)
        @comment.post_id = params[:post_id]
        @post = params[:id]

        if @comment.save 
            flash[:notice] = "Comment submitted."
            redirect_to user_post_path(current_user, @comment.post)
        else 
            flash[:notice] = "Comment failed to submit."
            redirect_to user_post_path
        end 
    end 

    def update 
    end 

    private 

    def comment_params
        params.require(:comment).permit(:body, :post_id)
    end 

    def get_post 
        @post = Post.find_by(id: params[:post_id])
    end 

end 
