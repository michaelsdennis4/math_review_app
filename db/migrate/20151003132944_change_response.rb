class ChangeResponse < ActiveRecord::Migration
  def change
  	rename_column :responses, :student_id, :assessment_id
  end
end
