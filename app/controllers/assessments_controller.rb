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
	
end
