class ReviewQuestionsController < ApplicationController

	def index
		@questions = ReviewQuestion.all
	end

	def new
		@topic = Topic.find(params[:topic_id])
	end

	def show
		@question = ReviewQuestion.find(params[:id])
	end

	def edit
		@question = ReviewQuestion.find(params[:id])
	end

	def create
		question = ReviewQuestion.create
		topic = Topic.find(params[:topic_id])
		if (question.update({topic: topic, question_text: params[:question_text], answer_text: params[:answer_text]}))
			redirect_to "/topics/#{topic.id}"
		else
			redirect_to "/topics/#{topic.id}/review_questions/new"
		end
	end

	def update
		question = ReviewQuestion.find(params[:id])
		if (question.update({question_text: params[:question_text], answer_text: params[:answer_text]}))
			redirect_to "/review_questions/#{question.id}"
		else
			redirect_to "/review_questions/#{question.id}/edit"
		end
	end

	def destroy
		question = ReviewQuestion.find(params[:id])
		question.destroy
		redirect_to "/topics/#{question.topic.id}"
	end

end
