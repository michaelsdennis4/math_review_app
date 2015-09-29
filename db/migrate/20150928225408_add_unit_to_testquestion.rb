class AddUnitToTestquestion < ActiveRecord::Migration
  def change
  	add_column :test_questions, :unit_id, :integer
  end
end
