class RemoveYtFromApplications < ActiveRecord::Migration
  def change
    remove_column :applications, :yt_video_id, :string
  end
end
