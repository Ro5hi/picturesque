class CommentsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :destroy]

    def new
        @comment = Comment.new 
        @comment.post_id = params[:post_id]
    end

    def create
        @comment = Comment.new(comment_only)
        @comment.user_id = current_user.id 
        @comment.post_id = params[:comment][:post_id]
        
        if @comment.save 
            redirect_to feed_path, flash: { success: "Comment submitted." }
        else 
            redirect_to new_comment_path, flash: { danger: "Comment failed to submit." }
        end 
    end 

    def destroy
        @comment = Comment.find(params[:id])
        post = @comment.post 

        if @comment.destroy
            redirect_to comments_path, flash: { success: "Comment deleted."}
        else 
            redirect_to comments_path, flash: { danger: "Could not delete comment."}
        end 
    end 

    private 

    def comment_only
        params.require(:comment).permit(:body, :user_id, :post_id, :id)
    end 

end 
