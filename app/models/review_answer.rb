# == Schema Information
#
# Table name: review_answers
#
#  id                 :integer          not null, primary key
#  review_question_id :integer
#  answer_text        :string
#  review_answer_uid  :string
#

class ReviewAnswer < ActiveRecord::Base

	belongs_to :review_question

end
