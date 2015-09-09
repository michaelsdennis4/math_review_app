class ReviewSessionsController < ApplicationController

	def index
		@sessions = ReviewSession.all 
	end

	def show
		@session = ReviewSession.find(params[:id])
	end

end
