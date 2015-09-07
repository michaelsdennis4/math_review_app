# == Schema Information
#
# Table name: topics
#
#  id          :integer          not null, primary key
#  unit_id     :integer
#  title       :string           not null
#  description :string
#  video_url   :string
#  created_at  :datetime
#  updated_at  :datetime
#

class Topic < ActiveRecord::Base

	validates :title, presence: true

	belongs_to :unit
	has_many :review_questions

end
