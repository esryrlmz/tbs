class AddCategoryIdToClub < ActiveRecord::Migration
  def change
    add_column :clubs, :category_id, :integer
  end
end
