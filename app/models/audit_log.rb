class AuditLog < ApplicationRecord
	belongs_to :user

	enum status: {sin_avance: 0, desarrollo: 1, revision: 2, comentarios: 3, cumplido: 4}


	def nombre_escuela 
		nombre_escuela = Escuela.where(id: self.escuela_id).first.nombre 
	end
end
