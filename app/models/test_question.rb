# == Schema Information
#
# Table name: test_questions
#
#  id                :integer          not null, primary key
#  session_id        :integer
#  question_text     :string
#  test_question_uid :string
#  points            :integer          default(1), not null
#  correct_answer    :string
#  created_at        :datetime
#  updated_at        :datetime
#

class TestQuestion < ActiveRecord::Base

	has_many :responses
	has_many :choices
	belongs_to :session

end
