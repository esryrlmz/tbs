class CreateClubContacts < ActiveRecord::Migration
  def change
    create_table :club_contacts do |t|
      t.integer :period_id
      t.text :address
      t.string :email
      t.string :phone_number
      t.string :face_url
      t.string :tw_url
      t.string :gplus_url
      t.string :youtube_url
      t.string :github_url
      t.string :linkedin_url

      t.timestamps null: false
    end
  end
end
