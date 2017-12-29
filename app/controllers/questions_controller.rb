class QuestionsController < ApplicationController
    def create
        @question = Question.new(question_params)
        @question.student = current_user
        if @question.save
            
            redirect_to course_path(@question.course)
        else
            @question.errors.full_messages.each do |m|
            flash[:alert] = m
            end
        @course = @question.course
        render 'courses/show'
        end
    end
    
    private
    
    def question_params
        params.require(:question).permit(:content, :course_id)
    end
    
end
