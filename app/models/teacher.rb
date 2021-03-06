# == Schema Information
#
# Table name: teachers
#
#  id              :integer          not null, primary key
#  first_name      :string           not null
#  last_name       :string           not null
#  email           :string           not null
#  password_digest :string           not null
#  is_active       :boolean          default(TRUE), not null
#  created_at      :datetime
#  updated_at      :datetime
#  is_admin        :boolean          default(FALSE), not null
#

class Teacher < ActiveRecord::Base

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true, uniqueness: true
	
	has_secure_password

	has_many :review_sessions
	has_many :assessments, :through => :review_sessions

end
