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
   
     
    validates_presence_of :nombre, :appaterno, :email
    validates :email, uniqueness: true 

    def gravatar_url
      gravatar_id = Digest::MD5::hexdigest(email).downcase
      "https://gravatar.com/avatar/#{gravatar_id}.png"
    end

end


