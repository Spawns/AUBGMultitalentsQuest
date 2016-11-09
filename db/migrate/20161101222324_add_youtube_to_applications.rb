class AddYoutubeToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :yt_video_id, :string
    add_column :applications, :is_complete, :boolean, default: false
  end
end
