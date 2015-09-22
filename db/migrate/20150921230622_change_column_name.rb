class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :test_questions, :test_question_uid, :image_uid
  end
end
