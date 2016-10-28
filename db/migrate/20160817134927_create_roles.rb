class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :user_id
      t.integer :club_period_id
      t.integer :role_type_id
      t.boolean :status, default: true
      t.string :explanation

      t.timestamps null: false
    end
  end
end
