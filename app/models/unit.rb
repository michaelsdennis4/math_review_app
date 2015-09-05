class Unit < ActiveRecord::Base

	validates :title, presence: true

	belongs_to :session
	has_many :topics

end