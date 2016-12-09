class AddRoleToPartners < ActiveRecord::Migration
  def change
    add_column :partners, :role, :string
  end
end
