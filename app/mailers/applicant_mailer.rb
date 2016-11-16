class ApplicantMailer < ActionMailer::Base
  default from: 'noreply@liberalartscompetition.org'
  def acceptance_mail(application)
    @application = application
    @url = 'https://aubgmultitalentsquest.herokuapp.com'
    mail(to: @application.email , subject: 'Congratulations! You have been accepted!')
  end
end
