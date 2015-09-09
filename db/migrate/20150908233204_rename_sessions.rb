class RenameSessions < ActiveRecord::Migration
  def change
  	rename_table(:sessions, :review_sessions)
  end
end
