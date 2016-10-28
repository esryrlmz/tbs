class ChangeCategoryIdToClubCategoryIdFromClubs < ActiveRecord::Migration
  def change
  	 rename_column :clubs, :category_id, :club_category_id
  end
end
