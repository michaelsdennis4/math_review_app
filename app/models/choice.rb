# == Schema Information
#
# Table name: choices
#
#  id               :integer          not null, primary key
#  test_question_id :integer
#  choice_text      :string
#  image_uid        :string
#

class Choice < ActiveRecord::Base

	validates :choice_text, presence: true

	belongs_to :test_question

	extend Dragonfly::Model
		dragonfly_accessor :image

end
