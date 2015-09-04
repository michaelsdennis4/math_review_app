class CreateReviewQuestions < ActiveRecord::Migration
  def change
    create_table :review_questions do |t|
    	t.integer :topic_id
    	t.string :question_text
    	t.string :question_uid
    	t.string :answer_text
    	t.string :answer_uid
    	t.timestamps
    end
  end
end
