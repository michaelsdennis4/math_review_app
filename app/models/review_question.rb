# == Schema Information
#
# Table name: review_questions
#
#  id            :integer          not null, primary key
#  topic_id      :integer
#  question_text :string
#  question_uid  :string
#  created_at    :datetime
#  updated_at    :datetime
#  is_active     :boolean          default(TRUE), not null
#

class ReviewQuestion < ActiveRecord::Base

	belongs_to :topic
	has_one :review_answer

end
