class Partner < ActiveRecord::Base
    validates_inclusion_of :role  , :in => %w( corporate individual), :message => "has to be either corporate or individual sponsor"
    validates :name, :presence => true
    has_attached_file :logo, :styles => { :medium => "300x300>" }, :default_url => "/images/:style/missing.jpg"
    validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/
end
