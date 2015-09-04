class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
    	t.integer :test_question_id
    	t.integer :student_id
    	t.string :student_answer
    	t.integer :student_score
    	t.timestamps
    end
  end
end
