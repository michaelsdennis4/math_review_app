# == Schema Information
#
# Table name: units
#
#  id                :integer          not null, primary key
#  review_session_id :integer
#  title             :string           not null
#  description       :string
#  created_at        :datetime
#  updated_at        :datetime
#  total_quiz_points :integer
#

class Unit < ActiveRecord::Base

	validates :title, presence: true

	belongs_to :review_session
	has_many :topics
	has_many :test_questions

	def points
		self.total_quiz_points = 0;
		self.test_questions.each do |question|
			if ((question.is_active == true) && (question.correct_answer) && (question.correct_answer > 0))
				self.total_quiz_points = self.total_quiz_points + question.points
			end
		end
		self.save;
	end

	def complete?(assessment)
		i = 0
		self.test_questions.each do |question|
			question.responses.each do |response|
				if (response.assessment == assessment)
					i = i + 1
				end
			end
		end
		# returns true also if no questions
		if (i == self.test_questions.count)  
			result = true
		else
			result = false
		end
	end

end
