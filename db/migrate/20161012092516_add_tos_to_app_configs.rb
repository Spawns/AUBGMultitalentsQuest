class AddTosToAppConfigs < ActiveRecord::Migration
  def change
    add_column :app_configs, :tos, :text
  end
end
