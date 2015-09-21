class Answers < ActiveRecord::Migration
  def change
  	remove_column :review_questions, :answer_text, :string
  	remove_column :review_questions, :answer_uid, :integer
  end
end
