class RenameIsActiveinUserstoIsPassive < ActiveRecord::Migration
  def change
  	 rename_column :users, :is_active, :is_passive
  end
end
