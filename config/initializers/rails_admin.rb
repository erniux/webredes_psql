RailsAdmin.config do |config|

  config.main_app_name = ["Escuelas Seguras", "" ]
  config.included_models = [ "Certificador", "Escuela", "EtapaCertificacion", "EstandarEtapaCertificacion", 
                             "PuntosEstandar",   "User", "CertEscolar", ]

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
  end

  config.model "PuntosEstandar" do
    visible false
  end

  config.model 'User' do
    label "Usuarios"
    list do
      field :email do
        label "Correo"
      end
      field :nombre 
      field :appaterno do
        label "Apellido Paterno"
      end       
      field :roles do
        label "Perfil de usuario"
      end
    end

    edit do
      field :email do
        label "Correo"
      end
      field :password do
        label "Contraseña"
      end
      field :password_confirmation do
        label "Confirmar Contraseña"
      end
      field :nombre do
        label "Nombre"
      end
      field :appaterno do
        label "Apellido Paterno"
      end
      
      field :escuela_id do
        label "Escuela"
        partial "nombre_escuela"
      end 
      field :roles do
        label "Perfil Usuario"
        partial "perfil_usuario"
       end
    end
  end

  config.model 'CertEscolar' do
    label "Certificaciones"
     list do
      field :nombre_escuela do
        label "Escuela"
         def value
          bindings[:object].escuela.nombre
         end
      end
      field :paso
      field :estandar
      field :status
      field :puntaje
     end
  end

  config.model 'EtapaCertificacion' do
    label 'Pasos'
      field :num_etapa do
        label 'Etapa'
      end  
      field :nombre
      field :descripcion do
        label 'Descripción'
      end
  end

  config.model 'EstandarEtapaCertificacion' do
    label 'Estandares'
    list do
      field :etapa_id do
        label 'Paso'
        def value
          bindings[:object].etapa_certificacion.num_etapa
        end
      end
      field :estandar_id
      field :titulo
      field :puntaje_total
    end

    edit do
      field :etapa_certificacion_id do
        label 'Paso'
        partial 'numero_etapa'
      end
       
      field :estandar_id
      field :titulo
      field :descripcion
      field :observaciones
      field :puntaje
      field :evidencias
      field :puntaje_total
      field :puntos_estandars do
        visible(true)
      end
    end
  end

  config.model 'PuntosEstandar' do
    edit do
      field :puntos
      field :descripcion
    end
  end
end

