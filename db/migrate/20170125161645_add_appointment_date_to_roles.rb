class AddAppointmentDateToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :appointment_date, :datetime
  end
end
