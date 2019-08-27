class Escuela < ApplicationRecord
  has_many :cert_escolars
  belongs_to :certificador

  before_validation :to_upper

  private
  def to_upper
    attributes.keys.each do |attribute|
      self[attribute].try(:upcase!)
    end
  end

  accepts_nested_attributes_for :cert_escolars, allow_destroy: true

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
	 


end

#Validar RFC
# /\?[a-z]{3,4}\?-d{6}\?([A-Z\d]{3})/