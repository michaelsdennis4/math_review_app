class Teacher < ActiveRecord::Base

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true, uniqueness: true
	validates :is_active, presence: true

	has_secure_password

	has_many :sessions

end