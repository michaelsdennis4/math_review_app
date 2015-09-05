class TestQuestion < ActiveRecord::Base

	has_many :responses
	has_many :choices
	belongs_to :session

end