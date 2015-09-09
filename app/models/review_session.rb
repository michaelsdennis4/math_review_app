# == Schema Information
#
# Table name: sessions
#
#  id                :integer          not null, primary key
#  course_id         :integer
#  teacher_id        :integer
#  title             :string           not null
#  total_test_points :integer
#  created_at        :datetime
#  updated_at        :datetime
#

class ReviewSession < ActiveRecord::Base

	validates :title, presence: true

	belongs_to :course
	belongs_to :teacher
	has_many :test_questions
	has_many :units
	has_many :assessments
	
end
