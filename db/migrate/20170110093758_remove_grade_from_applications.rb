class RemoveGradeFromApplications < ActiveRecord::Migration
  def change
    remove_column :applications, :grade, :integer
  end
end
