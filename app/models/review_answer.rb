# == Schema Information
#
# Table name: review_answers
#
#  id                 :integer          not null, primary key
#  review_question_id :integer
#  answer_text        :string
#  image_uid          :string
#

class ReviewAnswer < ActiveRecord::Base

	belongs_to :review_question

	extend Dragonfly::Model
		dragonfly_accessor :image

end
