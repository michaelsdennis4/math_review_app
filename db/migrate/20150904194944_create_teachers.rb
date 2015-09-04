class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
    	t.string :f_name, null: false
    	t.string :l_name, null: false
    	t.string :email, null: false
    	t.string :password_digest, null: false
    	t.boolean :is_active, null: false, default: 't'
    	t.timestamps
    end
  end
end
