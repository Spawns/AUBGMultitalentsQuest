class AddFacebookToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :facebook, :string
  end
end
