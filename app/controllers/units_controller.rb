class UnitsController < ApplicationController

	def index
		@units = Unit.all
	end

	def new
		@session = ReviewSession.find(params[:review_session_id])
	end

	def show
		@unit = Unit.find(params[:id])
	end

	def edit
		@unit = Unit.find(params[:id])
	end

	def create
		unit = Unit.create
		review_session = ReviewSession.find(params[:review_session_id])
		if (unit.update({review_session: review_session, title: params[:title], description: params[:description]}))
			redirect_to "/review_sessions/#{review_session.id}"
		else
			redirect_to "/review_sessions/#{review_session.id}/units/new"
		end
	end

	def update
		unit = Unit.find(params[:id])
		if (unit.update({title: params[:title], description: params[:description]}))
			redirect_to "/units/#{unit.id}"
		else
			redirect_to "/units/#{unit.id}/edit"
		end
	end

	def destroy
		unit = Unit.find(params[:id])
		if (unit.topics.count > 0)
			redirect_to "/units/#{unit.id}/edit"
		else
			unit.destroy
			redirect_to "/review_sessions/#{unit.review_session.id}"
		end
	end
	
end
