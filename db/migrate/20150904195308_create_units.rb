class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
    	t.integer :session_id
    	t.string :title, null: false
    	t.string :description
    	t.timestamps
    end
  end
end
