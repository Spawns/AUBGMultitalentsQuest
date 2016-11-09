class AddAttachmentPhotoToApplications < ActiveRecord::Migration
  def self.up
    change_table :applications do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :applications, :photo
  end
end
