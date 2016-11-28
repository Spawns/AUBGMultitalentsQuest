class RemoveMunincipalityFromApplications < ActiveRecord::Migration
  def change
    remove_column :applications, :school_municipality, :string
  end
end
