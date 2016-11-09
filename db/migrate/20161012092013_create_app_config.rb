class CreateAppConfig < ActiveRecord::Migration
  def change
    create_table :app_configs do |t|
      t.string :event_type
      t.string :event_location
      t.string :keywords
      t.string :description
      t.timestamps
    end
  end
end
