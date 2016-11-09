class AddTitlesTextToPosts < ActiveRecord::Migration
  def change
    add_column :posts  , :content , :text
    add_column :posts , :title , :string
  end
end
