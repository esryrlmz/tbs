class AddFirstNameAndLastNameAndProgramIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :user_name, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :program_code, :string
    add_column :users, :is_academic, :boolean
    add_column :users, :is_administrative, :boolean
    add_column :users, :degree, :string
  end
end
