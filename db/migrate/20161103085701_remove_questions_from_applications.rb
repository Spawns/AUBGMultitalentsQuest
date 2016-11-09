class RemoveQuestionsFromApplications < ActiveRecord::Migration
  def change
    remove_column :applications, :lib_arts, :text
    remove_column :applications, :memorable_xp, :text
    remove_column :applications, :contribution, :text
    remove_column :applications, :other_describe, :text
    remove_column :applications, :plastic_bottle, :text
    remove_column :applications, :yt_video_id, :string
    remove_column :applications, :is_complete, :boolean
  end
end
