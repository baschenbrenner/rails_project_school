class EnrollmentsController < ApplicationController

    def create
      @enrollment = Enrollment.create(enrollment_params)
      render json: @enrollment
    end

    def index
      @enrollments = Enrollment.where(course_id: params[:course_id])
      @students = @enrollments.map {|el| el.student}
      render json: @students
    end



private

  def enrollment_params
    params.require(:enrollment).permit(:course_id,:student_id)
  end


end
