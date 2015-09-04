class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
    	t.string :first_name, null: false
    	t.string :last_name, null: false
    	t.string :email, null: false
    	t.string :password_digest
    	t.integer :status, null: false, default: 0
    	t.string :identification
    	t.integer :grad_year
    	t.timestamps
    end
  end
end
