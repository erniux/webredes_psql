RailsAdmin.config do |config|
  
  config.main_app_name = Proc.new { |controller| [ "Escuelas seguras", "" ] }
  config.included_models = [ "Certificador", "Escuela", "EtapaCertificacion", "EstandarEtapaCertificacion", 
                             "PuntosEstandar",   "User", "Proceso", "ProcesoCertificacion" ]

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

  config.model "ProcesoCertificacion" do
    visible false
  end

  config.model 'User' do
    label 'Usuario'
    label_plural 'usuarios'
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

  config.model 'Proceso' do
    label 'Proceso'
    label_plural 'Procesos'
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
    label 'Paso'
    label_plural 'Pasos'
    object_label_method do
      :titulo_modelo
    end 
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
    label 'Estandar'
    label_plural 'Estandares'
    object_label_method do
      :titulo_modelo
    end 
    
    list do
      sort_by :proceso_id, :num_etapa, :num_estandar 
      field :proceso_id do
        label 'Proceso'
        def value
          bindings[:object].proceso.periodo
        end
      end
      field :etapa_certificacion_id  do
        label 'Paso'
        def value
          bindings[:object].etapa_certificacion.num_paso
        end
      end
       
      field :num_estandar do
        label 'Estandar'
      end
      field :titulo
      field :puntaje_total
    end
    edit do
      field :proceso_id do
        label 'periodo'
        partial 'numero_proceso'
      end
      field :etapa_certificacion_id do
        label 'Paso'
        partial 'periodo_paso'
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
    label 'Punto'
    label_plural 'Puntos por estandar'
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

  config.model 'ProcesoCertificacion' do
    object_label_method do
      :proceso_periodo
    end
    label 'Proceso'
    edit do
      field :proceso_id do
       partial 'proceso_certificacion_escuela'
     end
    end
  end

  config.model 'Certificador' do
    label 'Certificador'
    label_plural 'Certificadores'
    object_label_method do
      :cert_nombre_completo
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
    label 'Escuela'
    label_plural 'Escuelas'
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

    edit do 
      field :nombre
      field :razon_social do
        label 'Razón social'
      end
      field :rfc do
        label 'R.F.C.'
      end
      field :calle
      field :numero do
        label 'Número'
      end  
      field :colonia
      field :municipio
      field :delegacion do
        label 'Delegación'
      end

      field :ciudad
      field :estado
      field :cp do
        label 'C.P.'
      end
      field :correo
      field :telefono_oficina do
        label 'Teléfono de oficina'
      end
      field :sector
      field :nivel_basico do
        label 'Nivel Básico'
      end
      field :nivel_media_superior
      field :nivel_superior
      field :nivel_capacitacion do
        label 'Capacitación'
      end
      field :nivel_escolar_especifico do
        label 'Otro'
      end

      field :num_grupos do
        label 'Número de grupos'
      end
      field :num_promedio_alumnos do
        label 'Número promedio de alumnos'
      end

      field :num_promedio_personal do
        label 'Número promedio personal'
      end
      field :num_promedio_docentes do
        label 'Número promedio docentes'
      end
      field :nombre_enlace
      field :appaterno_enlace do
        label 'Apellido Paterno enlace'
      end
      field :apmaterno_enlace do
        label 'pellido Materno enlace'
      end
      field :cargo_enlace do
        label 'Cargo del enlace'
      end
      field :asignacion_actual_enlace
      field :correo_enlace
      field :telefono_enlace do
        label 'Teléfono enlace'
      end
      field :certificador_id do
         visible(false)
      end
      field :proceso_certificacions do
        label 'Procesos Certificación'
        visible(true)
      end
    end
  end

     

end

