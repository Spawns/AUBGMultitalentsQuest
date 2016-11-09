class ContactForm < MailForm::Base
  attributes :name,  :validate => true
  attributes :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attributes :message
  attributes :nickname,   :captcha => true
   def headers
    {
      :subject => "My Contact Form",
      :to => "liberalartscompetition@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
 
end