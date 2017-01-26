class AddFacultyIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :faculty_id, :integer
  end
end
