class ReviewAnswersController < ApplicationController

	def upload_image
		answer = ReviewAnswer.find(params[:id])
		answer.update({image: params[:image], image_uid: params[:image_uid]})
		redirect_to "/review_questions/#{answer.review_question.id}/edit"
	end

	def delete_image
		answer = ReviewAnswer.find(params[:id])
		answer.image = nil
		answer.save
		redirect_to "/review_questions/#{answer.review_question.id}/edit"
	end

end
