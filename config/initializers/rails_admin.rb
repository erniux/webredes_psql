RailsAdmin.config do |config|

  config.main_app_name = ["Escuelas Seguras", "" ]
  config.included_models = ["Acercade certificates", "CertEscolar", "Certificador", "Escuela", "EstandarEtapaCertificacion", 
                            "EtapaCertificacion", "PreguntasCert", "User" ]

  ## == Devise ==

  config.authorize_with do |controller|
    if user_signed_in?
      unless current_user.has_role?(:cert_site_admin)  
        redirect_to main_app.root_path 
      end
    else
      redirect_to main_app.root_path 
    end
  end
 
  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

  end
end
