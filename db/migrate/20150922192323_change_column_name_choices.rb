class ChangeColumnNameChoices < ActiveRecord::Migration
  def change
  	rename_column :choices, :choice_uid, :image_uid
  end
end
