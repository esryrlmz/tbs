class CreateClubSlides < ActiveRecord::Migration
  def change
    create_table :club_slides do |t|
      t.string :file
      t.string :title

      t.timestamps null: false
    end
  end
end
