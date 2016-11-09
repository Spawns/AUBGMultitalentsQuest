class Post < ActiveRecord::Base
       has_attached_file :image ,  :styles => {  :thumb => "150x150>" }, :default_url => ":style/missing.png"
       validates_attachment_content_type :image ,  :content_type => /\Aimage\/.*\Z/
      validates :content , presence: true
      validates :title , presence: true

end
