class CreateFinalists < ActiveRecord::Migration
  def change
    create_table :finalists do |t|
      t.string :name
      t.text :bio
      t.timestamps
    end
  end
end