class AssessmentsController < ApplicationController

	def index
		if (params[:student_id])
			@student = Student.find(params[:student_id])
			@assessments = @student.assessments.all
		elsif (params[:review_session_id])
			@session = ReviewSession.find(params[:review_session_id])
			@assessments = @session.assessments.all
		else
			@assessments = Assessment.all
		end
	end

	def show
		@assessment = Assessment.find(params[:id])
	end
	
end
