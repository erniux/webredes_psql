class Certificador < ApplicationRecord
	has_many :escuelas, dependent: :destroy 

	def cert_nombre_completo
		cert_nombre_completo =  nombre + ' ' + appaterno
	end
 
	validates_uniqueness_of :email

	validates_presence_of :nombre, :appaterno 

end
