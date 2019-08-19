class PuntosEstandar < ApplicationRecord
  	belongs_to :estandar_etapa_certificacion 

 
	def truncated_content
 		self.descripcion.truncate(100)
	end

end
