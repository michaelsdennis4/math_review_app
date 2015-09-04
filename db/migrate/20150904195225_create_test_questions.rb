class CreateTestQuestions < ActiveRecord::Migration
  def change
    create_table :test_questions do |t|
    	t.integer :session_id
    	t.string :question_text
    	t.string :test_question_uid
    	t.integer :points, null: false, default: 1
    	t.string :correct_answer
    	t.timestamps
    end
  end
end
