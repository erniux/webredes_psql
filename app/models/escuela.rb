class Escuela < ApplicationRecord 
  has_many :proceso_certificacions, :dependent => :destroy 
  has_many :users, :dependent => :destroy
   

  before_validation :to_upper
   
  accepts_nested_attributes_for :proceso_certificacions, allow_destroy: true
   
  validates :nombre, uniqueness: {case_sensitive: false}, presence: true 
  validates :razon_social, uniqueness: {case_sensitive: false}, presence: true 
  validates :rfc, uniqueness: {case_sensitive: false}, presence: true 
  validates_presence_of :calle, :numero, :colonia, :municipio, :delegacion, 
						  :ciudad, :estado, :cp, :correo, :telefono_oficina, :sector, :nombre_enlace, 
						  :appaterno_enlace, :apmaterno_enlace, :cargo_enlace, :asignacion_actual_enlace, 
						  :correo_enlace, :telefono_enlace

  validates_format_of :telefono_oficina, :telefono_enlace,
  						:with => /\(?[0-9]{3}\)?-[0-9]{3}-[0-9]{4}/,
  						:message => "- Formato: XXX-XXX-XXXX."	

  validates :nombre, length: { in: 6..100 }
  validates :razon_social, length: { in: 6..200 }
  validates :rfc, length: { in: 14..15 , message: "Formato: XXX-XXXXXX-XXX o XXXX-XXXXXX-XXX." }

  before_destroy do |escuela|
    if !escuela.certificador_id.nil? 
      puts "escuela tiene certificador!!!!!!"
       
      #escuela.certificador_id.delete 
       
    end
    if !escuela.users.nil?
      puts "escuela tiene usuarios"
    end

    puts "toy en before_destroy de la escuelita"
    #buscar en cert_escolar y borrar
      @cert_escolar = CertEscolar.where(escuela_id: escuela.id)

      if !@cert_escolar.nil?
        puts @cert_escolar.inspect
        @cert_escolar.destroy_all
        puts 'si tiene procesos asignados y certificaciones'
      end
  end

  def nombre_completo_enlace
  	nombre_enlace = (nombre_enlace.to_s + appaterno_enlace.to_s + apmaterno_enlace.to_s) if !nombre_enlace.blank?
  end 

  def nombre_certificador
    nombre  = Certificador.find_by_id(certificador_id)
    nombre_certificador = nombre.nombre + ' ' + nombre.appaterno
  end

  def certificaciones
    certificaciones = CertEscolar.where(escuela_id: id)
  end

  private
  def to_upper
    attributes.keys.each do |attribute|
      self[attribute].try(:upcase!)
    end
  end
end

#Validar RFC
# /\?[a-z]{3,4}\?-d{6}\?([A-Z\d]{3})/