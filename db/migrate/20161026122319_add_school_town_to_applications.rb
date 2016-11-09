class AddSchoolTownToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :school_town, :string
    add_column :applications, :school_municipality, :string
    add_column :applications, :school_region, :string
  end
end
