class CompetitionDocument < ActiveRecord::Base
   validates :name , presence: true
   validates :description , presence: true
    has_attached_file :document
    validates_attachment_size :document, :less_than => 10.megabytes    
    validates_attachment_presence :document
   validates_attachment :document, :content_type => [ :content_type => ["application/pdf","application/vnd.ms-excel", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "application/msword", "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "text/plain"]]

end
