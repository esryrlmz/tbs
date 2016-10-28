class CreateEventLocations < ActiveRecord::Migration
  def change
    create_table :event_locations do |t|
      t.string :name
      t.integer :club_id

      t.timestamps null: false
    end
  end
end
