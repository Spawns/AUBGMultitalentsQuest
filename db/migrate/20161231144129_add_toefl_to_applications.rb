class AddToeflToApplications < ActiveRecord::Migration
  def self.up
    change_table :applications do |t|
      t.attachment :toefl
    end
  end

  def self.down
    remove_attachment :applications, :toefl
  end
end
