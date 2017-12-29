class CommentsController < ApplicationController
    def create
        
        @comment = Comment.new(comment_params)
        if session[:user_type] == "student"
            @comment.student = current_user
        elsif session[:user_type] == "teacher"
            @comment.teacher = current_user
        end
        @comment.save
        @course = @comment.course
        redirect_to course_path(@course)
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
