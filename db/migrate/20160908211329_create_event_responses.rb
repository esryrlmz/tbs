class CreateEventResponses < ActiveRecord::Migration
  def change
    create_table :event_responses do |t|
      t.integer :event_id
      t.integer :event_status_id
      t.string :explanation

      t.timestamps null: false
    end
  end
end
