class TestQuestionsController < ApplicationController

	def index
		@session = ReviewSession.find(params[:review_session_id])
		@questions = @session.test_questions.all.order(:id)
	end

	def new
		@session = ReviewSession.find(params[:review_session_id])
	end

	def show
		@question = TestQuestion.find(params[:id])
	end

	def edit
		@question = TestQuestion.find(params[:id])
	end

	def create
		question = TestQuestion.create
		review_session = ReviewSession.find(params[:review_session_id])
		4.times do |i|
			choice = Choice.create
			choice.update({test_question: question, choice_text: "choice #{i+1}"})
		end
		if (question.update({review_session: review_session, question_text: params[:question_text], points: params[:points]}))
			question.review_session.points
			redirect_to "/test_questions/#{question.id}/edit"
		else
			redirect_to "/review_sessions/#{review_session.id}/test_questions/new"
		end
	end

	def update
		question = TestQuestion.find(params[:id])
		if (question.update({question_text: params[:question_text], points: params[:points], correct_answer: params[:correct_answer], is_active: params[:is_active]}))
			question.review_session.points
			redirect_to "/test_questions/#{question.id}"
		else
			redirect_to "/test_questions/#{question.id}/edit"
		end
	end

	def upload_image
		question = TestQuestion.find(params[:id])
		question.update({image: params[:image], image_uid: params[:image_uid]})
		redirect_to "/test_questions/#{question.id}/edit"
	end

	def delete_image
		question = TestQuestion.find(params[:id])
		question.image = nil
		question.save
		redirect_to "/test_questions/#{question.id}/edit"
	end

	def destroy
		question = TestQuestion.find(params[:id])
		if (question.responses.count > 0)
			redirect_to "/review_sessions/#{question.review_session.id}/test_questions/#{question.id}"
		else
			question.choices.each do |choice|
				choice.destroy
			end
			question.image = nil
			question.save
			question.destroy
			question.review_session.points
			redirect_to "/review_sessions/#{question.review_session.id}/test_questions"
		end		
	end

end
