class AddVideoToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :video_url, :string

  end
end
