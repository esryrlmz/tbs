class CreateAnnouncments < ActiveRecord::Migration
  def change
    create_table :announcments do |t|
      t.integer :club_period_id
      t.string :title
      t.text :content
      t.boolean :is_view
      t.boolean :is_advisor_confirmation

      t.timestamps null: false
    end
  end
end
