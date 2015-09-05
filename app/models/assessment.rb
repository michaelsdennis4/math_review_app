class Assessment < ActiveRecord::Base

	validates :status, presence: true

	belongs_to :student
	belongs_to :session

end