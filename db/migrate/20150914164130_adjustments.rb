class Adjustments < ActiveRecord::Migration
  def change
  	add_column :teachers, :is_admin, :boolean, default: false, null: false
  	add_column :test_questions, :is_active, :boolean, default: true, null: false
  	add_column :review_questions, :is_active, :boolean, default: true, null: false
  	remove_column :choices, :choice_key, :string
  	remove_column :test_questions, :correct_answer, :string
  	add_column :test_questions, :correct_answer, :integer
  end
end
