namespace :notification do
  desc "Send SMS notificacion to site_admin notifying new contact intereseted in our processess"
  task sms: :environment do
  	puts "i am a task sms"
  end

  desc "Send mail notificacion to site_admin to inform new contact"
  task admin_email: :environment do
  	ContactoMailer.form_contacto(Contacto.last).deliver_now
  end

end
