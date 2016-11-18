class AddYtToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :yt_video_id, :string
  end
end
