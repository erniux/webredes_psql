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

    after_save do |user|
      if user.has_roles?(:certificador)
        puts 'AQUI ESTOY PARA CREAR UN CERTIFICADOR'
      else
        puts 'PS COMO QUE NO LO VALIDA' + user.roles.to_s
      end

    end

    def nombre_escuela 
      if !self.escuela_id.blank?
        nombre_escuela = Escuela.where(id: self.escuela_id).first.nombre.compact.join(',')
      end
    end

end


