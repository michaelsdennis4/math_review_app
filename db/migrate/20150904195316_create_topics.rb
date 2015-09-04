class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
    	t.integer :unit_id
    	t.string :title, null: false
    	t.string :description
    	t.string :video_url
    	t.timestamps
    end
  end
end
