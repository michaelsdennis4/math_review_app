class ResponsesController < ApplicationController

	def create
		response = Response.create
		assessment = Assessment.find(params[:assessment_id])
		question = TestQuestion.find(params[:question_id])
		if (question.review_session_id)
			session = question.review_session
		else
			unit = question.unit
		end
		student_answer = Choice.find(params[:student_answer])
		if (question.correct_answer == student_answer.id)
			score = question.points
		else
			score = 0
		end
		response.update({test_question: question, assessment: assessment, student_answer: student_answer.id, student_score: score})
		if (session)
			redirect_to "/assessments/#{assessment.id}/review_sessions/#{session.id}/test_questions/#{question.id}"
		else
			redirect_to "/assessments/#{assessment.id}/units/#{unit.id}/test_questions/#{question.id}"
		end
	end

end