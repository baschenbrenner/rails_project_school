class EnrollmentsController < ApplicationController

    def create
    end

    def index
      @enrollments = Enrollment.where(course_id: params[:course_id])
      @students = @enrollments.map {|el| el.student}
      render json: @students
    end






end
