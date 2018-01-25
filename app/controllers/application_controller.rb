class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def check_access
    if !session[:user_type]
      flash[:alert] = "You do not have access to that page"
      redirect_to home_path
    end
  end

  def check_access_teacher
    if session[:user_type] != "teacher"
      flash[:alert] = "You do not have access to that page"
      redirect_to home_path
    end
  end

  def current_user
      if user_signed_in?
          if session[:user_type] == "student"
            Student.find(session[:user_id])
          else
            Teacher.find(session[:user_id])
          end

      end

  end

  def user_signed_in?
      !!session[:user_type]
  end


  def user_creation
    if !session[:user_type]
      if @teacher
        if @teacher.id
          session[:user_type]="teacher"
          session[:user_id]= @teacher.id
          flash[:notice]= "Sign Up Successful"
          redirect_to teacher_path(@teacher)
        else
          @teacher.errors.full_messages.each do |m|
            flash[:alert] = m
          end
          render 'welcome/new_teacher'
        end
      elsif @student
        if @student.id
          session[:user_type]="student"
          session[:user_id]= @student.id
          flash[:notice]= "Sign Up Successful"
          redirect_to student_path(@student)
        else
           @student.errors.full_messages.each do |m|
          flash[:alert] = m
          end
          render 'welcome/new_student'
        end
      end
    elsif session[:user_type] == "teacher"
      if @student.id
      flash[:notice]= "Student Successfully Created"
      redirect_to teacher_path(Teacher.find(session[:user_id]))

      else
        @student.errors.full_messages.each do |m|
        flash[:alert] = m
        end
        render 'teachers/new_student'
      end
    end


  end

  def create_comment
    if session[:user_type] == "student"
            @comment.student = current_user
    elsif session[:user_type] == "teacher"
            @comment.teacher = current_user
    end

    if @comment.save
            @course = @comment.course
            redirect_to course_path(@course)
    else
            @comment.errors.full_messages.each do |m|
            flash[:alert] = m
            end
            @course = @comment.course
            redirect_to course_path(@course)
    end
  end


  def determine_type_of_view
    if session[:user_type] 
        @courses = current_user.courses
    else
        @courses = Course.all
    end
  end


end
