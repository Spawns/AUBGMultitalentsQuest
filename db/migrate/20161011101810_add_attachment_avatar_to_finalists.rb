class AddAttachmentAvatarToFinalists < ActiveRecord::Migration
  def self.up
    change_table :finalists do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :finalists, :avatar
  end
end
