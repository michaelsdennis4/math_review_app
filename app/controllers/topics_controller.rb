class TopicsController < ApplicationController

	# require 'youtube_it'

	def index
		@topics = Topic.all
	end

	def new
		@unit = Unit.find(params[:unit_id])
	end

	def show
		@topic = Topic.find(params[:id])
		@questions = @topic.review_questions.all.order(:id)
	end

	def edit
		@topic = Topic.find(params[:id])
		# @client = YouTubeIt::Client.new(:username => ENV['GOOGLE_USER_NAME'], :password => ENV['GOOGLE_PASSWORD'], :dev_key => ENV['GOOGLE_SERVER_KEY_1'])
	end

	def create
		topic = Topic.create
		unit = Unit.find(params[:unit_id]) 
		if (topic.update({unit: unit, title: params[:title], description: params[:description], video_url: params[:video_url]}))
			redirect_to "/units/#{unit.id}"
		else
			redirect_to "/units/#{unit.id}/topics/new"
		end
	end

	def update
		topic = Topic.find(params[:id])
		if (topic.update({title: params[:title], description: params[:description], video_url: params[:video_url]}))
			redirect_to "/topics/#{topic.id}"
		else
			redirect_to "/topics/#{topic.id}/edit"
		end
	end

	def destroy
		topic = Topic.find(params[:id])
		if (topic.review_questions.count > 0)
			redirect_to "/topics/#{topic.id}/edit"
		else
			topic.destroy
			redirect_to "/units/#{topic.unit.id}"
		end
	end

end
