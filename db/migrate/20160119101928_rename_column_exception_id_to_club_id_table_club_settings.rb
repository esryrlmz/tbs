class RenameColumnExceptionIdToClubIdTableClubSettings < ActiveRecord::Migration
  def change
  	 rename_column :club_settings, :period_id, :club_id
  end
end
