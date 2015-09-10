class AssessmentsController < ApplicationController

	def index
		@assessments = Assessment.all
	end

	def student
		@assessments = Assessment.where({student_id: params[:student_id]})
		render :index
	end

	def show
		@assessment = Assessment.find(params[:id])
	end
	
end
