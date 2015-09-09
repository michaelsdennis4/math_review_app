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
#

class Unit < ActiveRecord::Base

	validates :title, presence: true

	belongs_to :review_session
	has_many :topics

end
