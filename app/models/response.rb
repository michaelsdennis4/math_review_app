class Response < ActiveRecord::Base

	belongs_to :student
	belongs_to :test_question

end