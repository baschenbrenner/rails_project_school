class EnrollmentsController < ApplicationController

    def create
      @enrollment = Enrollment.create(course_id: params[:course_id], student_id: params[:student_id])
      render json: @enrollment
    end

    def index
      @enrollments = Enrollment.where(course_id: params[:course_id])
      @students = @enrollments.map {|el| el.student}
      render json: @students
    end






end
