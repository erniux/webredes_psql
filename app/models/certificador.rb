class Certificador < ApplicationRecord

	has_many :escuelas

	def nombre_completo
		self.nombre + ' ' + self.appaterno
	end

	validates_presence_of :nombre, :appaterno, :especialidad, :email, :telefono, :domicilio

end
