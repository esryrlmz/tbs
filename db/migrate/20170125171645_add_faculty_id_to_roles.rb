class AddFacultyIdToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :faculty_id, :integer
  end
end
