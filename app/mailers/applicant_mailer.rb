class ApplicantMailer < ActionMailer::Base
  default from: 'noreply@liberalartscompetition.org'
  def acceptance_mail(application)
    @application = application
    @url = 'www.AUBGMultiTalentsQuest.org'
    mail(to: @application.email , subject: 'Congratulations! You have been accepted!')
  end
end
