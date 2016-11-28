class CreateUploader < ActiveRecord::Migration
  def self.up
    create_table :uploaders do |t|
      t.string   :title
      t.string   :description
      t.string   :yt_video_id
      t.timestamps
      t.belongs_to :application
    end
  end

  def self.down
    drop_table :uploaders
  end
end
