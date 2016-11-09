class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.time :start
      t.time :stop
      t.string :title
      t.string :description
      t.timestamps
    end
  end
end
