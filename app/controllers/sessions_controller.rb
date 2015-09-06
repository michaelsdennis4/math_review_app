class SessionsController < ApplicationController

	#renders the login form
  def new 
  end

  #creates a session
  def create_teacher
    user = Teacher.find_by({email: params[:email]})
    if (user && user.authenticate(params[:password]))
      session[:user_id] = user.id
      session[:user_name] = "#{user.first_name} #{user.last_name}"
      session[:is_teacher] = true
      redirect_to "/" #dashboard
    else
      redirect_to '/login'
    end
  end

  def create_student
    user = Student.find_by({email: params[:email]})
    if (user && user.authenticate(params[:password]))
      session[:user_id] = user.id
      session[:user_name] = "#{user.first_name} #{user.last_name}"
      session[:is_teacher] = false
      redirect_to "/" #dashboard
    else
      redirect_to '/login'
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