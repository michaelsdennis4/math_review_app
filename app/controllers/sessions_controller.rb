class SessionsController < ApplicationController

	#renders the login form
  def new 
  end

  def new_teacher
    render :new_teacher
  end

  def new_student
    render :new_student
  end

  #creates a session
  def create_teacher
    user = Teacher.find_by({email: params[:email]})
    if (user && user.authenticate(params[:password]))
      session[:user_id] = user.id
      session[:user_name] = "#{user.first_name} #{user.last_name}"
      session[:is_teacher] = true
      redirect_to "/dashboard" #dashboard
    else
      redirect_to '/sessions/new_teacher'
    end
  end

  def create_student
    user = Student.find_by({email: params[:email]})
    if (user && user.authenticate(params[:password]))
      session[:user_id] = user.id
      session[:user_name] = "#{user.first_name} #{user.last_name}"
      session[:is_teacher] = false
      redirect_to "/dashboard" #dashboard
    else
      redirect_to '/sessions/new_student'
    end
  end

  #nulls user session (logout)
  def destroy
  	session[:user_id] = nil
    session[:user_name] = nil
    session[:is_teacher] = nil
  	redirect_to '/'
  end

end