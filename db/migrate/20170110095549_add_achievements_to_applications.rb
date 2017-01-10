class AddAchievementsToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :achievements, :text
  end
end
