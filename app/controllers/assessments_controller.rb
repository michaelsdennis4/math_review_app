class AssessmentsController < ApplicationController

	def index
		if (params[:student_id])
			@student = Student.find(params[:student_id])
			@assessments = @student.assessments.all
		elsif (params[:teacher_id])
			@teacher = Teacher.find(params[:teacher_id])
			@assessments = @teacher.assessments
		elsif (params[:review_session_id])
			@session = ReviewSession.find(params[:review_session_id])
			@assessments = @session.assessments.all
		else
			@assessments = Assessment.all
		end
	end

	def new
		@session = ReviewSession.find(params[:review_session_id])
		@students = Student.all.order(:last_name, :first_name)
	end

	def show
		if (params[:student_id])
			@student = Student.find(params[:student_id])
		elsif (params[:teacher_id])
			@teacher = Teacher.find(params[:teacher_id])
		elsif (params[:review_session_id])
			@session = ReviewSession.find(params[:review_session_id])
		end
		@assessment = Assessment.find(params[:id])
	end

	def edit
		@assessment = Assessment.find(params[:id])
	end

	def create
		assessment = Assessment.create
		session = ReviewSession.find(params[:review_session_id])
		student = Student.find(params[:student_id])
		if (assessment.update({student: student, review_session: session, date_assigned: DateTime.now}))
			redirect_to "/review_sessions/#{session.id}/assessments"
		else
			redirect_to "/review_sessions/#{session.id}/assessments/new"
		end
	end

	def update
		assessment = Assessment.find(params[:id])
	end

	def destroy
	end



	
end
