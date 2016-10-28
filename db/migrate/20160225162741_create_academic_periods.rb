class CreateAcademicPeriods < ActiveRecord::Migration
  def change
    create_table :academic_periods do |t|
      t.string :name
      t.boolean :is_active

      t.timestamps null: false
    end
  end
end
