class Student < ActiveRecord::Base

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true, uniqueness: true
	validates :status, presence: true

	has_secure_password

	has_many :assessments
	has_many :responses

end