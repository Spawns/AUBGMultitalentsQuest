class AddGradeToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :grade, :integer
  end
end
