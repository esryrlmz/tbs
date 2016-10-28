class CreateClubBoardOfDirectors < ActiveRecord::Migration
  def change
    create_table :club_board_of_directors do |t|
      t.integer :club_period_id
      t.integer :president_id
      t.integer :vice_president_id
      t.integer :accountant_id
      t.integer :secretary_id
      t.integer :member_one
      t.integer :member_two
      t.integer :member_three

      t.timestamps null: false
    end
  end
end
