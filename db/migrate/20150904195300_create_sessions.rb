class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
    	t.integer :course_id
    	t.integer :teacher_id
    	t.string :title, null: false
    	t.integer :total_test_points
    	t.timestamps
    end
  end
end
