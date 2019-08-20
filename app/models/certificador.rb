class Certificador < ApplicationRecord

	has_many :escuelas

	def nombre_completo
		self.nombre + ' ' + self.appaterno
	end

end
