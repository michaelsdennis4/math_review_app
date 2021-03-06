# == Schema Information
#
# Table name: assessments
#
#  id                 :integer          not null, primary key
#  student_id         :integer
#  review_session_id  :integer
#  student_test_score :integer
#  status             :string           default("assigned"), not null
#  date_assigned      :date
#  created_at         :datetime
#  updated_at         :datetime
#

class Assessment < ActiveRecord::Base

	validates :status, presence: true

	belongs_to :student
	belongs_to :review_session
	belongs_to :teacher
	has_many :responses

end
