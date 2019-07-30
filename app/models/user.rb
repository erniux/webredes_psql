class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  ############################################################################################ 
    petergate(roles: [:admin, :editor, :socio, :certificador, :escuela, :site_admin, :cert_site_admin], multiple: false)                                      
  
  
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :timeoutable
  
    has_many :eventos
    has_many :avisos
    has_many :audit_logs
    belongs_to :escuelas
     

    validates_presence_of :nombre, :appaterno, :email, :rfc, :razon_social, :domicilio_fiscal, :nombre_enlace, 
                          :appaterno_enlace, :apmaterno_enlace, :cargo_enlace, :correo_enlace, :telefono_enlace  


    def nombre_completo
      "#{nombre_enlace} #{appaterno_enlace} #{apmaterno_enlace} "
    end 

    def nombre_certificador
      "#{nombre} #{appaterno} "
    end  

    def self.nuevas_escuelas
      find_by_sql("SELECT t1.razon_social, t1.id, t1.roles FROM users t1 WHERE t1.roles = 'escuela' AND NOT EXISTS (SELECT NULL FROM escuelas t2 WHERE t2.user_id = t1.id)")
    end                          

    def self.certificadores
      find_by_sql("SELECT t1.nombre, t1.appaterno, t1.id, t1.roles FROM users t1 WHERE t1.roles = 'certificador'")
    end           

    def self.nombre_escuela
      find_by_sql("SELECT t1.razon_social, t1.id, t1.roles FROM users t1 WHERE t1.roles = 'escuela' AND EXISTS (SELECT NULL FROM escuelas t2 WHERE t2.user_id = t1.id)")
    end  

    def  usuario(usuario_id)
      User.where("id = ?", usuario_id)
    end  
end


