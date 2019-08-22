class Escuela < ApplicationRecord
  has_many :cert_escolars
  belongs_to :certificador

  accepts_nested_attributes_for :cert_escolars, allow_destroy: true

	validates :nombre, uniqueness: true 
	validates_presence_of :nombre, :razon_social, :rfc, :calle, :numero, :colonia, :municipio, :delegacion, 
								   :ciudad, :estado, :cp, :correo, :telefono_oficina, :sector, :nombre_enlace, 
								   :appaterno_enlace, :apmaterno_enlace, :cargo_enlace, :asignacion_actual_enlace, 
								   :correo_enlace, :telefono_enlace

end

