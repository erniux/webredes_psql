class PreguntasCert < ApplicationRecord

	def self.preguntas_contestadas
		find_by_sql("SELECT pregunta, respuesta FROM preguntas_certs WHERE respuesta NOT LIKE '%Respuesta Pendiente%'")
	end

end
