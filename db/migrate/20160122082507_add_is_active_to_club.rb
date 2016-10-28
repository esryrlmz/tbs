class AddIsActiveToClub < ActiveRecord::Migration
  def change
    add_column :clubs, :is_active, :boolean
  end
end
