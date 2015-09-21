class ReviewQuestionsController < ApplicationController

	def index
		@questions = ReviewQuestion.all.order(:id)
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
		answer = ReviewAnswer.create
		answer.update({review_question: question})
		if (question.update({topic: topic, question_text: params[:question_text]}))
			if (question.review_answer.update({answer_text: params[:answer_text]}))
				redirect_to "/topics/#{topic.id}"
			else
				redirect_to "/topics/#{topic.id}/review_questions/new"
			end
		else
			redirect_to "/topics/#{topic.id}/review_questions/new"
		end
	end

	def update
		question = ReviewQuestion.find(params[:id])
		if (question.update({question_text: params[:question_text], is_active: params[:is_active]}))
			if (question.review_answer.update({answer_text: params[:answer_text]}))
				redirect_to "/review_questions/#{question.id}"
			else
				redirect_to "/review_questions/#{question.id}/edit"
			end
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
