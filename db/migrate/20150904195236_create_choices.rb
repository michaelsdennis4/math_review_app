class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
    	t.integer :test_question_id 
    	t.string :answer_key, null: false
    	t.string :answer_text
    	t.string :choice_uid
    end
  end
end
