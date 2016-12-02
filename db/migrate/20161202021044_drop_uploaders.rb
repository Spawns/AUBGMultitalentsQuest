class DropUploaders < ActiveRecord::Migration
  def change
    drop_table :uploaders
  end
end
