# == Schema Information
#
# Table name: courses
#
#  id   :integer          not null, primary key
#  name :string           not null
#

class Course < ActiveRecord::Base

	validates :name, presence: true

	has_many :review_sessions

end
