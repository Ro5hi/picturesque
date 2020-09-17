class CommentsController < ApplicationController    
    before_action set_comment, only: [:show]
    
    def new
        @comment = Comment.new 
        @comment.post_id = params[:post_id]
    end

    def create
        @comment = Comment.new(comment_only)
        @comment.user_id = current_user.id 
        @comment.post_id = params[:comment][:post_id]
        
        if @comment.save 
            flash[:success] = "Comment submitted."
            redirect_to posts_path
        else 
            flash[:danger] = "Comment failed to submit."
            redirect_to new_comment_path
        end 
    end 

    def show 
    end 

    private 

    def comment_only
        params.require(:comment).permit(:body, :user_id, :post_id, :id)
    end 

    def set_comment 
        @comment = Comment.find(params[:id])
    end  

end 
