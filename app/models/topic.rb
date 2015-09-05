class Topic < ActiveRecord::Base

	validates :title, presence: true

	belongs_to :unit
	has_many :review_questions

end