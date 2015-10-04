# == Schema Information
#
# Table name: review_sessions
#
#  id                :integer          not null, primary key
#  course_id         :integer
#  teacher_id        :integer
#  title             :string           not null
#  total_test_points :integer
#  created_at        :datetime
#  updated_at        :datetime
#  test_type         :integer
#  test_url          :string
#

class ReviewSession < ActiveRecord::Base

	validates :title, presence: true

	belongs_to :course
	belongs_to :teacher
	has_many :test_questions
	has_many :units
	has_many :assessments

	def points
		self.total_test_points = 0;
		self.test_questions.each do |question|
			if ((question.is_active == true) && (question.correct_answer) && (question.correct_answer > 0))
				self.total_test_points = self.total_test_points + question.points
			end
		end
		self.save;
	end

	def quizzes_complete?(assessment)
		i = 0
		self.units.each do |unit|
			if (unit.complete?(assessment) == true)
				i = i + 1
			end
		end
		if (i == self.units.count)
			result = true
		else
			result = false
		end
	end

	
end
