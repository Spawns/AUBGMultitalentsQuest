class AddContentToPages < ActiveRecord::Migration
  def change
    add_column :pages, :content1, :text
  end
end
