class AddQuizPointsToUnit < ActiveRecord::Migration
  def change
  	add_column :units, :total_quiz_points, :integer
  end
end
