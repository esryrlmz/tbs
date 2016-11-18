class AddIsActiveToClubSetting < ActiveRecord::Migration
  def change
    add_column :club_settings, :is_active, :boolean, default: true
  end
end
