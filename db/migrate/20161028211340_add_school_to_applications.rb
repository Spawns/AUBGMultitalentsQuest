class AddSchoolToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :school, :string
  end
end
