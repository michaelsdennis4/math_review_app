class Choice < ActiveRecord::Base

	validates :choice_key, presence: true

	belongs_to :test_question

end