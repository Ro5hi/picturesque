class CommentsController < ApplicationController    

    def new
        @comment = Comment.new 
        @comment.post_id = params[:post_id]
    end

    def create
        @comment = Comment.new(comment_only)
        @comment.user_id = current_user.id 
        @comment.post_id = params[:comment][:post_id] 

        if @comment.save 
            flash[:notice] = "Comment submitted."
            redirect_to @comment.post
        else 
            flash[:notice] = "Comment failed to submit."
            redirect_to new_comment_path
        end 
    end 

    private 

    def comment_only
        params.require(:comment).permit(:body, :user_id, :post_id, :id)
    end 

end 
