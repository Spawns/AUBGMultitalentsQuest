class Application < ActiveRecord::Base

  #To reach the scope, you can use Application.denied, to return all denied applicants
  scope :submitted , -> { where(status: 'submitted')}
  scope :incomplete , -> {where(status: 'incomplete')}
  scope :accepted , -> {where(status: 'accepted')}
  scope :denied , -> {where(status: 'denied')}


before_save :default_values
 belongs_to :user

  has_attached_file :photo, :styles => { :medium => "250x250", :thumb => "100x100" }, :default_url => ":style/missing.jpg"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  validates_attachment :photo , :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }, :size => { :in => 0..1000.kilobytes, :message => "Photo must be less than 1 megabytes in size"}

  has_attached_file :gradebook_photo, :styles => { :medium => "250x250", :thumb => "100x100" }, :default_url => ":style/missing.jpg"
  validates_attachment_content_type :gradebook_photo, :content_type => /\Aimage\/.*\Z/
  validates_attachment :gradebook_photo , :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }, :size => { :in => 0..1000.kilobytes, :message => "Photo must be less than 1 megabytes in size"}

  validates_acceptance_of :terms_of_service
  validates :name, :dob, :gender, :mobile_phone, :current_address, :city, :terms_of_service, :presence => true, :on => :update, :if => :active_or_personal?
  validates :name, format: { with: /\A[a-zA-Z ]+\z/, message: "allows only letters" }, :on => :update, :if => :active_or_personal?
  validates :mobile_phone, format: { with: /\d[0-9]\)*\z/, message: "allows only numbers" }, :on => :update, :if => :active_or_personal?
  validates :high_school_grade, :gradebook_photo, :school, :school_region, :school_town, :on => :update, :presence => true, :if => :active_or_educational?
  validates :school, :school_region, :school_town, :on => :update, format: { with: /\A[a-zA-Z ]+\z/, message: "allows only letters" }, :if => :active_or_educational?
  validates :favourite_subject, :self_describe, :learned_from, :photo, :facebook, :presence => true, :on => :update,  :if => :active_or_letters?
  validates_length_of :favourite_subject, :maximum => 70, :too_short => "Your favourite subject description must be at most 50 words.", :tokenizer => lambda {|str| str.scan(/\w+/) }, :on => :update,  :if => :active_or_letters?
  validates :video_url,  :presence => true, :on => :update,  :if => :active_or_video?

  def active?
    steps == 'incomplete'
  end

  def active_or_personal?
    self.steps.include?('personal') || active?
  end

  def active_or_educational?
    self.steps.include?('educational') || active?
  end

  def active_or_letters?
    self.steps.include?('letters') || active?
  end

  def active_or_video?
    self.steps.include?('video') || active?
  end

  def email
    self.user.email
  end


   #default values set on create
    def default_values
       self.status ||= "incomplete"
    end
    #check attributes to see if the application is completed
    def check_attributes
     self.attributes.each do |attr_name , attr_value|
       if attr_value.blank? || attr_value.nil?
        return false
       end
     end
    end

    def submit
      self.update_attribute(:status , "submitted")
    end

    def incomplete
      self.update_attribute(:status , "incomplete")
    end

    def accept
      self.update_attribute(:status , "accepted")
      ApplicantMailer.acceptance_mail(self)
    end

    def deny
      self.update_attribute(:status , "denied")
    end

end
