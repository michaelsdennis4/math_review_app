class CreateTableAnswers < ActiveRecord::Migration
  def change
    create_table :review_answers do |t|
    	t.integer :review_question_id
    	t.string  :answer_text
    	t.string  :review_answer_uid
    end
  end
end