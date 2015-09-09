class RenameColumnUnits < ActiveRecord::Migration
  def change
  	rename_column(:units, :session_id, :review_session_id)
  	rename_column(:assessments, :session_id, :review_session_id)
  	rename_column(:test_questions, :session_id, :review_session_id)
  end
end
