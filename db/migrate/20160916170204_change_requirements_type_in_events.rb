class ChangeRequirementsTypeInEvents < ActiveRecord::Migration
  def change
  	 change_column :events, :requirements, :text
  end
end
