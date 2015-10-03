# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  test_question_id :integer
#  assessment_id    :integer
#  student_score    :integer
#  created_at       :datetime
#  updated_at       :datetime
#  student_answer   :integer
#

class Response < ActiveRecord::Base

	belongs_to :assessment
	belongs_to :test_question

end
