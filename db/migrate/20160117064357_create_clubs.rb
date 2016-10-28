class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :short_name
      t.text :description
      t.datetime :creation_date

      t.timestamps null: false
    end
  end
end
