class ChangeColumnImages < ActiveRecord::Migration
  def change
  	rename_column :review_questions, :question_uid, :image_uid
  	rename_column :review_answers, :review_answer_uid, :image_uid
  end
end
