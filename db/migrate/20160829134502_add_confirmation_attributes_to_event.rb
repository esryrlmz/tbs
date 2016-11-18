class AddConfirmationAttributesToEvent < ActiveRecord::Migration
  def change
    add_column :events, :is_advisor_confirmation_ok, :boolean, default: false
    add_column :events, :is_admin_confirmation_ok, :boolean, default: false
  end
end
