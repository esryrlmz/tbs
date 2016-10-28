class CreateSystemAnnouncments < ActiveRecord::Migration
  def change
    create_table :system_announcments do |t|
      t.string :title
      t.text :content
      t.boolean :is_view

      t.timestamps null: false
    end
  end
end
