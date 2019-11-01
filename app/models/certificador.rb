class Certificador < ApplicationRecord
	has_many :escuelas

	def nombre_completo
		self.nombre + ' ' + self.appaterno
	end

	validates_presence_of :nombre, :appaterno, :especialidad, :email, :telefono, :domicilio

	
	validates_format_of :telefono,
  						:with => /\(?[0-9]{3}\)?-[0-9]{3}-[0-9]{4}/,
  						:message => "- Formato debe ser xxx-xxx-xxxx."	

end
