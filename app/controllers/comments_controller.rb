class CommentsController < ApplicationController
    def create
        binding.pry
        @course = @comment.course
        redirect_to course_path(@course)
    end
    
    
    
end
