class TeachersController < ApplicationController

	def index
		@teachers = Teacher.all.order(:last_name, :first_name)
	end

	def new
	end

	def show
		@teacher = Teacher.find(params[:id])
	end

	def edit
		@teacher = Teacher.find(params[:id])
	end

	def create
		teacher = Teacher.create
		if (teacher.update({first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation]}))
			redirect_to "/teachers"
		else
			redirect_to "/teachers/new"
		end
	end

	def update
		teacher = Teacher.find(params[:id])
		if (teacher.update({first_name: params[:first_name], last_name: params[:last_name], email: params[:email], is_active: params[:is_active], is_admin: params[:is_admin]}))
			redirect_to "/teachers/#{teacher.id}"
		else
			redirect_to "/teachers/#{teacher.id}/edit"
		end
	end

	def password
		teacher = Teacher.find(params[:id])
		if (session[:is_admin] == true)
			if (teacher.update({password: params[:new_password], password_confirmation: params[:password_confirmation]}))
				redirect_to "/teachers/#{teacher.id}"
			else
				redirect_to "/teachers/#{teacher.id}/edit"
			end
		else
			if ((params[:new_password] == params[:password_confirmation]) && (teacher.authenticate(params[:old_password])) && (teacher.update({password: params[:new_password], password_confirmation: params[:password_confirmation]})))
				redirect_to "/teachers/#{teacher.id}"
			else
				redirect_to "/teachers/#{teacher.id}/edit"
			end
		end
	end

end
