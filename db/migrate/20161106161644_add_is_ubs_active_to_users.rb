class AddIsUbsActiveToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_ubs_active, :boolean, default: false
  end
end
