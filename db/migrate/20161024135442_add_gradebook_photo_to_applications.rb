class AddGradebookPhotoToApplications < ActiveRecord::Migration
  def self.up
    change_table :applications do |t|
      t.attachment :gradebook_photo
    end
  end

  def self.down
    remove_attachment :applications, :gradebook_photo
  end
end
