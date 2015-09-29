class ChangeTestType < ActiveRecord::Migration
  def change
  	add_column :review_sessions, :test_type, :integer
  	add_column :review_sessions, :test_url, :string
  end
end
