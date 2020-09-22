class CommentsController < ApplicationController    

    def new
        @comment = Comment.new
        @user = current_user
        @post = Post.find_by(params[:id])
    end

    def create
        
        @comment = current_user.comments.build(comment_params)
        @comment.post_id = params[:post_id]

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
        params.require(:comment).permit(:user_id, :post_id, :body)
    end 

end 
