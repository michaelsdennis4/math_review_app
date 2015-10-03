# == Schema Information
#
# Table name: test_questions
#
#  id                :integer          not null, primary key
#  review_session_id :integer
#  question_text     :string
#  image_uid         :string
#  points            :integer          default(1), not null
#  created_at        :datetime
#  updated_at        :datetime
#  is_active         :boolean          default(TRUE), not null
#  correct_answer    :integer
#  unit_id           :integer
#

class TestQuestion < ActiveRecord::Base

	has_many :responses
	has_many :choices
	belongs_to :review_session
	belongs_to :unit

	extend Dragonfly::Model
		dragonfly_accessor :image

	def answered?(assessment)
		result = false
		responses.each do |response|
			if (response.assessment == assessment)
				result = true
			end
		end
		result
	end

end
