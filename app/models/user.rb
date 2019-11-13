class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  ############################################################################################ 
    petergate(roles: [:admin, :editor, :socio, :certificador, :escuela, :site_admin, :cert_site_admin], multiple: false)                                      
  
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :timeoutable
        
    validates_presence_of :nombre, :appaterno, :email
    validates :email, uniqueness: true 

    before_validation do |user|
      if user.has_roles?(:escuela)
        validates_presence_of :escuela_id
      end
    end

    before_destroy do |user|
      puts '************** before destroy ************** '
      if user.has_roles?(:certificador)
        certificador = Certificador.where(email: user.email) 
        if !certificador.blank?
          certificador.first.destroy
        end
      end
    end

    before_save do |user|
      puts '************** before save ************** '
      if user.roles_changed?
        puts '************** before.roles_changed  ************** '
        if user.has_roles?(:certificador)
          puts '************** valida si el nuevo rol es certificador ************** '
          certificador = Certificador.create!(nombre: user.nombre, appaterno: user.appaterno, email: user.email)
          puts '************** before save se crea el certificador en la tabla ' + user.inspect.to_s + certificador.inspect.to_s
        elsif 
          certificador = Certificador.where(email: user.email) 
          if !certificador.blank?
            certificador.first.destroy
          end 
        end
      end
    end

    def nombre_usuario
      nombre_usuario = nombre.to_s + ' ' + appaterno.to_s
    end

    def nombre_escuela 
      if !self.escuela_id.blank?
        nombre_escuela = Escuela.where(id: self.escuela_id).first.nombre.compact.join(',')
      end
    end

end


