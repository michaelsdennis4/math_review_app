class ReviewSessionsController < ApplicationController

	def index
		@sessions = ReviewSession.all.order(:id)
	end

	def new
		@course = Course.find(params[:course_id])
	end

	def show
		if (params[:assessment_id])
			@assessment = Assessment.find(params[:assessment_id])
			if (@assessment.student.id != session[:student_id])
				redirect_to "/error" 
			end
		end
		@session = ReviewSession.find(params[:id])
		@units = @session.units.all.order(:id)
	end

	def edit
		@session = ReviewSession.find(params[:id])
	end

	def instructions
		@assessment = Assessment.find(params[:id])
		@session = @assessment.review_session
	end

	def create
		new_session = ReviewSession.create
		course = Course.find(params[:course_id])
		teacher = Teacher.find(session[:user_id])
		if (new_session.update({course: course, teacher: teacher, title: params[:title], total_test_points: 0, test_type: params[:test_type], test_url: params[:test_url]}))
			redirect_to "/courses/#{course.id}"
		else
			redirect_to "/courses/#{course.id}/review_sessions/new"
		end
	end

	def update
		session = ReviewSession.find(params[:id])
		if (session.update({title: params[:title], test_type: params[:test_type], test_url: params[:test_url]}))
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
