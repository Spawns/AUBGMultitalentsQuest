class Partner < ActiveRecord::Base
    validates :link , :presence => true
    validates :name, :presence => true
    validates_format_of :link, :with => /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/
    has_attached_file :logo, :styles => { :medium => "300x300>" }, :default_url => "/images/:style/missing.jpg"
    validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/
end
