class CreateClubPeriods < ActiveRecord::Migration
  def change
    create_table :club_periods do |t|
      t.integer :club_id
      t.integer :academic_period_id

      t.timestamps null: false
    end
  end
end
