RailsAdmin.config do |config|
  
  config.main_app_name = Proc.new { |controller| [ "Escuelas seguras", "" ] }
  config.included_models = [ "Certificador", "Escuela", "EtapaCertificacion", "EstandarEtapaCertificacion", 
                             "PuntosEstandar",   "User", "CertEscolar", "Proceso" ]
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
    new do
      except ['Certificador']
    end
    export
    bulk_delete 
    show
    edit
    delete do
      except ['Certificador']
    end
  end

  config.model "PuntosEstandar" do
    visible false
  end

  config.model 'User' do
    label "Usuarios"
    object_label_method do
      :nombre_usuario
    end
    list do
      sort_by :email
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
      
      field :roles do
        label "Perfil Usuario"
        partial "perfil_usuario"
      end

      field :escuela_id do 
        partial "nombre_escuela"
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
    edit do
    end 
  end

  config.model 'Proceso' do
    object_label_method do
      :periodo
    end
      field :periodo do
        label 'Periódo'
      end
      field :estatus
      field :titulo do
        label 'Título'
      end
      list do
        sort_by :periodo
      end
  end

  config.model 'EtapaCertificacion' do
    object_label_method do
      :titulo_modelo
    end 

    label 'Pasos'
    list do
      sort_by :proceso_id, :num_paso

      field :proceso_id do
        label 'Proceso'
        def value
          bindings[:object].proceso.periodo
        end
      end
      field :num_paso do
        label 'Paso'
      end  
      field :nombre
      field :descripcion do
        label 'Descripción'
      end
    end

    edit do
      field :proceso_id do
        partial 'numero_proceso'
      end
      field :num_paso do
        label 'Paso'
      end
      field :nombre
      field :descripcion do
        label 'Descripción'
      end
    end
  end

  config.model 'EstandarEtapaCertificacion' do
     object_label_method do
      :titulo_modelo
    end 
    label 'Estandares'
    list do
      sort_by :etapa_certificacion_id, :num_paso
      field :num_paso do
        label 'Paso-Periódo'
        def value  
          bindings[:object].etapa_certificacion.etapa_periodo
        end
      end
      field :num_estandar
      field :titulo
      field :puntaje_total
    end

    edit do
      field :etapa_certificacion_id do
        label 'Paso'
        partial 'numero_etapa'
      end

      field :num_estandar
      field :titulo do
        label 'Título'
      end
      field :descripcion do
        label 'Descripción'
      end
      field :evidencias
      field :observaciones
      field :puntaje_total do 
        label 'Puntaje máximo'
      end

      field :obligatorio, :multiple_active_storage do
        label 'Documentos obligatorios'
        delete_method :remove_obligatorio
      end
       
      field :apoyo, :multiple_active_storage do
        label 'Documentos de Apoyo'
        delete_method :remove_apoyo
       end 

      field :puntos_estandars do
        label 'Detalle Puntaje'
        visible(true)
      end
    end
  end

  config.model 'PuntosEstandar' do
    object_label_method do
      :puntos
    end
    edit do
      field :puntos
      field :descripcion do 
        label 'Descripción'
      end
    end
  end

  config.model 'Certificador' do
    object_label_method do
      :nombre_completo
    end 
    list do
      field :nombre
      field :appaterno do
        label 'Apellido Paterno'
      end
      field :email
    end
  end

  config.model 'Escuela' do
    object_label_method do
      :nombre 
    end 

    list do
      field :nombre do
        label 'Nombre escuela'
      end
      field :rfc do
        label 'R.F.C.'
      end
      field :estado
      field :nombre_completo_enlace do
        label 'Enlace escolar'
      end
      field :correo_enlace
      field :telefono_enlace
       
    end
  end
end

