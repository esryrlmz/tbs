class AddLogoToUser < ActiveRecord::Migration
  def change
    add_column :clubs, :logo, :string
  end
end
