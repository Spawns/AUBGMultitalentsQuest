class AddStatusToUploaders < ActiveRecord::Migration
  def change
    add_column :uploaders, :status, :string
  end
end
