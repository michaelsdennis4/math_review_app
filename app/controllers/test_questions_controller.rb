class TestQuestionsController < ApplicationController

	def index
		@questions = TestQuestion.all
	end

	def show
		@question = TestQuestion.find(params[:id])
	end

end
