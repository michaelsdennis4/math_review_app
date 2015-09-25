class ReviewSessionsController < ApplicationController

	def index
		@sessions = ReviewSession.all 
	end

	def new
		@course = Course.find(params[:course_id])
	end

	def show
		@session = ReviewSession.find(params[:id])
	end

	def edit
		@session = ReviewSession.find(params[:id])
	end

	def create
		new_session = ReviewSession.create
		course = Course.find(params[:course_id])
		teacher = Teacher.find(session[:user_id])
		if (new_session.update({course: course, teacher: teacher, title: params[:title], total_test_points: 0}))
			redirect_to "/courses/#{course.id}"
		else
			redirect_to "/courses/#{course.id}/review_sessions/new"
		end
	end

	def update
		session = ReviewSession.find(params[:id])
		if (session.update({title: params[:title]}))
			redirect_to "/review_sessions/#{session.id}"
		else
			redirect_to "/review_sessions/#{session.id}/edit"
		end
	end

	def destroy
		session = ReviewSession.find(params[:id])
		course = session.course
		if (session.units.count > 0)
			redirect_to "/review_sessions/#{session.id}/edit"
		else
			session.destroy
			redirect_to "/courses/#{course.id}"
		end
	end

end
