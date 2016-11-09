class AddStepsToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :steps, :string
  end
end
