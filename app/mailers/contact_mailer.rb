class ContactMailer < ActionMailer::Base
  default from: "info@vhda.mx"

  def send_mail(name,correo,msj)
    @name = name
    @correo = correo
    @msj = msj
    mail(to: "info@vhda.mx", subject: 'VHDA CONTACTO')
  end

end
