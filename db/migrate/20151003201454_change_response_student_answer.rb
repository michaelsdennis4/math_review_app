class ChangeResponseStudentAnswer < ActiveRecord::Migration
  def change
  	remove_column :responses, :student_answer, :string
  	add_column :responses, :student_answer, :integer
  end
end
