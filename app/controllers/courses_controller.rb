class CoursesController < ApplicationController


  def show
    check_access
    @course = Course.find(params[:id])
    @question = Question.new
    @questions = @course.questions
    @comment = Comment.new
    respond_to do |format|
        format.html {

         }
        format.json {
        render json: @course}

      end
  end

  def new
    check_access_teacher
    @course = Course.new
  end

  def create
    check_access_teacher
    @course = Course.create(course_params)
    respond_to do |format|
      format.json {
         render json: @course}
        format.html {
          redirect_to teacher_path(current_user)
         }

     end
  end

  def index
    check_access
    @enrollment = Enrollment.new
    respond_to do |format|
        format.html {
          determine_type_of_view
         }
        format.json {
          @courses = Course.all
        render json: @courses}
     end
  end

  def edit
    @course = Course.find(params[:course]["id"])
  end

  def update
    @course = Course.find(params[:id])
    @course.update(course_params)
    redirect_to teacher_path(current_user)
  end

  def destroy
    @course = Course.find(params[:id])
    @course.delete
    redirect_to teacher_path(current_user)
  end

  private

  def course_params
    params.require(:course).permit(:title, :description, :catalog_number, :room_number, :teacher_id, :day_time_meeting)
  end

end
