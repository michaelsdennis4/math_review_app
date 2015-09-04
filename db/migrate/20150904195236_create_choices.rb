class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
    	t.integer :test_question_id 
    	t.string :choice_key, null: false
    	t.string :choice_text
    	t.string :choice_uid
    end
  end
end
