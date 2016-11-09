class AddStartAndStopToAppConfigs < ActiveRecord::Migration
  def change
    add_column :app_configs, :conf_start, :date
    add_column :app_configs, :conf_end, :date
  end
end
