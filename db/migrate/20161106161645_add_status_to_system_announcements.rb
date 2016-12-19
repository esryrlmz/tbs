class AddStatusToSystemAnnouncements < ActiveRecord::Migration
  def change
    add_column :system_announcements, :status, :string
  end
end
