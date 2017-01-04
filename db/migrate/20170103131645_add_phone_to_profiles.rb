class AddPhoneToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :phone, :string
    add_column :profiles, :email, :string
    add_column :profiles, :adress, :string
  end
end
