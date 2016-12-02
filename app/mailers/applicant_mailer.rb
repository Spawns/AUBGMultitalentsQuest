class ApplicantMailer < ActionMailer::Base
  default from: 'noreply@aubgquest.org'
  def acceptance_mail(application)
    @application = application
    @url = 'https://aubgquest.herokuapp.com'
    mail(to: @application.email , subject: 'Congratulations! You have been accepted!')
  end
end
