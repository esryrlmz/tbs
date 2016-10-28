class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :club_period_id
      t.integer :event_category_id
      t.string :title
      t.string :speakers
      t.datetime :datetime
      t.text :content
      t.string :location
      t.string :requirements
      t.string :text
      t.integer :event_status_id
      t.boolean :confirm_is_required
      t.string :event_confirm_result
      t.string :image

      t.timestamps null: false
    end
  end
end
