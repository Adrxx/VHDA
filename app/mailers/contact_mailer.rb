class ContactMailer < ActionMailer::Base
  default from: "from@example.com"

  def send_mail(name,mail)
    @name = name
    @url  = 'http://example.com/login'
    mail(to: mail, subject: 'Welcome to My Awesome Site')
  end

end
