class RenameColumnExceptionIdToClubIdTableClubContacts < ActiveRecord::Migration
  def change
  	 rename_column :club_contacts, :period_id, :club_id
  end
end
