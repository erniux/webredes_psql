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

    after_create do |user|
      if user.has_roles?(:certificador)
        certificador = Certificador.create!(nombre: user.nombre, appaterno: user.appaterno, email: user.email)
      end
    end

    def nombre_escuela 
      if !self.escuela_id.blank?
        nombre_escuela = Escuela.where(id: self.escuela_id).first.nombre.compact.join(',')
      end
    end

end


