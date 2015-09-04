class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
    	t.integer :student_id
    	t.integer :session_id
    	t.integer :student_test_score
    	t.string :status, null: false, default: 'assigned'
    	t.date :date_assigned
    	t.timestamps
    end
  end
end
