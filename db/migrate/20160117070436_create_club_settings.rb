class CreateClubSettings < ActiveRecord::Migration
  def change
    create_table :club_settings do |t|
      t.integer :period_id
      t.integer :max_user
      t.string :program_id

      t.timestamps null: false
    end
  end
end
