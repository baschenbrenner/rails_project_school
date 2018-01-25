class EnrollmentsController < ApplicationController

    def create
    end

    def index
      binding.pry
      @enrollments = Enrollment.all
      render json: @enrollments
    end






end
