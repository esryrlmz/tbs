class AddClubIdToClubSlide < ActiveRecord::Migration
  def change
    add_column :club_slides, :club_id, :integer
  end
end
