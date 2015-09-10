class ReviewQuestionsController < ApplicationController

	def index
		@questions = ReviewQuestion.all
	end

	def show
		@question = ReviewQuestion.find(params[:id])
	end

end
