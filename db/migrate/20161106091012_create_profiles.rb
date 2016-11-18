class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :full_name
      t.datetime :birthday
      t.string :faculty
      t.string :program
      t.string :program_id
      t.boolean :crime, default: false
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
