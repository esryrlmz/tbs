class AddUbsNoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ubs_no, :string
  end
end
