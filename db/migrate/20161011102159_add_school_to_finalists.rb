class AddSchoolToFinalists < ActiveRecord::Migration
  def change
    add_column :finalists, :school  , :string
  end
end
