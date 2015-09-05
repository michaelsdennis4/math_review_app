class Session < ActiveRecord::Base

	validates :title, presence: true

	belongs_to :course
	belongs_to :teacher
	has_many :test_questions
	has_many :units
	has_many :assessments
	
end