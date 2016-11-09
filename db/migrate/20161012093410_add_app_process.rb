class AddAppProcess < ActiveRecord::Migration
  def change
    add_column :app_configs, :app_process , :boolean
    remove_column :app_configs, :event_location
    remove_column :app_configs, :event_type
  end
end
