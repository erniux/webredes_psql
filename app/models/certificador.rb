class Certificador < ApplicationRecord
	has_many :escuelas

	def cert_nombre_completo
		nombre_completo = User.where(email: self.email).first
		cert_nombre_completo = nombre_completo.nombre + ' ' + nombre_completo.appaterno
	end
 
	validates_uniqueness_of :email

	validates_presence_of :nombre, :appaterno 

end
