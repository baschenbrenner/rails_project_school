class CommentsController < ApplicationController
    def create
        
        @comment = Comment.new(comment_params)
        create_comment
    end
    
    def edit
        @comment = Comment.find(params[:id])
    end
    
    def update
        @comment = Comment.find(params[:id])
        @comment.update(comment_params)
        redirect_to student_path(current_user)
    end
    
    
    private
    
    def comment_params
        params.require(:comment).permit(:content, :question_id)
    end
    
end
