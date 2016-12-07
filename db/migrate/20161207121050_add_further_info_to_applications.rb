class AddFurtherInfoToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :further_info, :boolean
  end
end
