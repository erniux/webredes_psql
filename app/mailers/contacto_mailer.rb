class ContactoMailer < ApplicationMailer

  def form_contacto(contacto)
  	 
  	@saludo = "Quiere contactarse contigo #{contacto.nombre}"
  	@comentarios = contacto.comentarios
  	@correo = contacto.correo
  	# =>>> to: a quien va.       de quien viene. 
     mail(to: "desarrolloswat@gmail.com", subject: contacto.asunto)
  end


end
