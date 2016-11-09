class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :name
      t.string :dob
      t.string :gender
      t.string :mobile_phone
      t.string :current_address
      t.string :city
      t.string :high_school_grade
      t.string :learned_from
      t.text :favourite_subject
      t.text :lib_arts
      t.text :memorable_xp
      t.text :contribution
      t.text :self_describe
      t.text :other_describe
      t.text :plastic_bottle
      t.timestamps
    end
  end
end
