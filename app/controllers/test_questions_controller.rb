class TestQuestionsController < ApplicationController

	def index
		if (params[:assessment_id])
			@assessment = Assessment.find(params[:assessment_id])
			if (@assessment.student.id != session[:student_id])
				redirect_to "/error" 
			end
		end	
		if (params[:review_session_id]) 
			@session = ReviewSession.find(params[:review_session_id])
			@questions = @session.test_questions.all.order(:id)
		else
			@unit = Unit.find(params[:unit_id])
			@questions = @unit.test_questions.all.order(:id)
		end
	end

	def new
		if (params[:review_session_id]) 
			@session = ReviewSession.find(params[:review_session_id])
		else
			@unit = Unit.find(params[:unit_id])
		end
	end

	def show
		@question = TestQuestion.find(params[:id])
		if (params[:assessment_id])
			@assessment = Assessment.find(params[:assessment_id])
			if (@assessment.student.id != session[:student_id])
				redirect_to "/error" 
			end		
		end	
		if (@question.review_session)
			@questions = @question.review_session.test_questions.all.order(:id)
		else
			@questions = @question.unit.test_questions.all.order(:id)
		end
		@number = @questions.find_index(@question) + 1
		@choices = @question.choices.all.order(:id)
		
		@student_answer = @question.responses.where({})
	end

	def edit
		@question = TestQuestion.find(params[:id])
	end

	def create
		question = TestQuestion.create
		if (params[:review_session_id]) 
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
		else
			unit = Unit.find(params[:unit_id])
			4.times do |i|
				choice = Choice.create
				choice.update({test_question: question, choice_text: "choice #{i+1}"})
			end
			if (question.update({unit: unit, question_text: params[:question_text], points: params[:points]}))
				question.unit.points
				redirect_to "/test_questions/#{question.id}/edit"
			else
				redirect_to "/units/#{unit.id}/test_questions/new"
			end
		end
	end

	def update
		question = TestQuestion.find(params[:id])
		if (params[:review_session_id]) 
			if (question.update({question_text: params[:question_text], points: params[:points], correct_answer: params[:correct_answer], is_active: params[:is_active]}))
				question.review_session.points
				redirect_to "/test_questions/#{question.id}"
			else
				redirect_to "/test_questions/#{question.id}/edit"
			end
		else
			if (question.update({question_text: params[:question_text], points: params[:points], correct_answer: params[:correct_answer], is_active: params[:is_active]}))
				question.unit.points
				redirect_to "/test_questions/#{question.id}"
			else
				redirect_to "/test_questions/#{question.id}/edit"
			end

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
