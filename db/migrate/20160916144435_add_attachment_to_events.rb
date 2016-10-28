class AddAttachmentToEvents < ActiveRecord::Migration
  def change
    add_column :events, :attachment, :string
  end
end
