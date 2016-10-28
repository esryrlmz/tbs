class CreateClubBoardOfSupervisories < ActiveRecord::Migration
  def change
    create_table :club_board_of_supervisories do |t|
      t.integer :club_period_id
      t.integer :principal_member_one
      t.integer :principal_member_two
      t.integer :principal_member_three
      t.integer :reserve_member_one
      t.integer :reserve_member_two
      t.integer :reserve_member_three

      t.timestamps null: false
    end
  end
end
