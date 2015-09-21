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
			redirect_to "/test_questions/#{question.id}/edit"
		else
			redirect_to "/review_sessions/#{review_session.id}/test_questions/new"
		end
	end

	def update
		question = TestQuestion.find(params[:id])
		if (question.update({question_text: params[:question_text], points: params[:points], correct_answer: params[:correct_answer], is_active: params[:is_active]}))
			redirect_to "/test_questions/#{question.id}"
		else
			redirect_to "/test_questions/#{question.id}/edit"
		end
	end

	def destroy
		question = TestQuestion.find(params[:id])
		if (question.responses.count > 0)
			redirect_to "/test_questions/#{question.id}/edit"
		else
			question.choices.each do |choice|
				choice.destroy
			end
			question.destroy
			redirect_to "/review_sessions/#{question.review_session.id}"
		end		
	end

end
