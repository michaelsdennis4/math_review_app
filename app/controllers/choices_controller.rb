class ChoicesController < ApplicationController

	def index
		@choices = Choice.all.order(:id)
	end

	def new
		@question = TestQuestion.find(params[:test_question_id])
	end

	def show
		@choice = Choice.find(params[:id])
	end

	def edit
		@choice = Choice.find(params[:id])
	end

	def create
		choice = Choice.create
		question = TestQuestion.find(params[:test_question_id])
		if (choice.update({test_question: question, choice_text: params[:choice_text]}))
			redirect_to "/test_questions/#{choice.test_question.id}"
		else
			redirect_to "/test_questions/#{choice.test_question.id}/choices/new"
		end
	end

	def update
		choice = Choice.find(params[:id])
		if (choice.update({choice_text: params[:choice_text]}))
			redirect_to "/test_questions/#{choice.test_question.id}"
		else
			redirect_to "/choices/#{choice.id}/edit"
		end
	end

	def upload_image
		choice = Choice.find(params[:id])
		if (choice.update({image: params[:image], image_uid: params[:image_uid]}))
			redirect_to "/test_questions/#{choice.test_question.id}"
		else
			redirect_to "/choices/#{choice.id}/edit"
		end
	end

	def delete_image
		choice = Choice.find(params[:id])
		choice.image = nil
		choice.save
		redirect_to "/choices/#{choice.id}/edit"
	end

	def destroy
		choice = Choice.find(params[:id])
		choice.destroy
		redirect_to "/test_questions/#{choice.test_question.id}" 
	end

end
