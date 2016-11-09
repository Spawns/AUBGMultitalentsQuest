class Finalist < ActiveRecord::Base
 validates :name , presence: true
 validates :bio , presence: true
 validates :school , presence: true
 has_attached_file :avatar, :styles => { :medium => "224x224>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
 validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
