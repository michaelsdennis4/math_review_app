# == Schema Information
#
# Table name: review_questions
#
#  id            :integer          not null, primary key
#  topic_id      :integer
#  question_text :string
#  question_uid  :string
#  answer_text   :string
#  answer_uid    :string
#  created_at    :datetime
#  updated_at    :datetime
#

class ReviewQuestion < ActiveRecord::Base

	belongs_to :topic

end
