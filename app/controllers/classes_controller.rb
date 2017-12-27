class ClassesController < ApplicationController
  def show
  end

  def index
    @courses = Course.all
  end
end
