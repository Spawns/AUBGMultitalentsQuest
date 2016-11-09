class AddUrlToAppConfigs < ActiveRecord::Migration
  def change
    add_column :app_configs, :yt_url, :string
    add_column :app_configs, :tw_url, :string
    add_column :app_configs, :fb_url, :string
  end
end
