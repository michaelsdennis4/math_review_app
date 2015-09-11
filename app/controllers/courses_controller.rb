class CoursesController < ApplicationController

	def index
		@courses = Course.all
	end

	def new
	end

	def show
		@course = Course.find(params[:id])
	end

	def edit
		@course = Course.find(params[:id])
	end

	def create
		course = Course.create({name: params[:name]})
		course.save
		redirect_to "/courses"
	end

	def update
		course = Course.find(params[:id])
		if (course.update({name: params[:name]}))
			redirect_to "/courses/#{course.id}"
		else
			redirect_to "/courses/#{course.id}/edit"
		end
	end

	def destroy
		course = Course.find(params[:id])
		if (course.review_sessions.count > 0)
			redirect_to "/courses/#{course.id}/edit"
		else
			course.destroy
			redirect_to "/courses"
		end
	end

end
