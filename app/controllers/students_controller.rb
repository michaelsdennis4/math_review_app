class StudentsController < ApplicationController

	def index
		@students = Student.all.order(:last_name, :first_name)
	end

	def new
	end

	def show
		@student = Student.find(params[:id])
	end

	def edit
		@student = Student.find(params[:id])
	end

	def create
		student = Student.create
		if (student.update({first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], grad_year: params[:grad_year], identification: params[:identification]}))
			redirect_to "/students"
		else
			redirect_to "/students/new"
		end
	end

	
end
