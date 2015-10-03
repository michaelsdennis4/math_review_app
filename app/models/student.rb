# == Schema Information
#
# Table name: students
#
#  id              :integer          not null, primary key
#  first_name      :string           not null
#  last_name       :string           not null
#  email           :string           not null
#  password_digest :string
#  status          :integer          default(0), not null
#  identification  :string
#  grad_year       :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class Student < ActiveRecord::Base

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true, uniqueness: true
	validates :status, presence: true

	has_secure_password

	has_many :assessments

end
