class CoursesController < ApplicationController

	def index
		@courses = Course.all
	end

	def show
		@course = Course.find(params[:id])
		@sessions = ReviewSession.where({course: @course})
	end

end
