class CertEscolar < ApplicationRecord
	include PgSearch::Model

	belongs_to :escuela

	has_many_attached :evidencias

  	enum status: {sin_avance: 0, en_desarrollo: 1, revision: 2, revisado_con_comentarios: 3, cumplido: 4}

  	validates_presence_of :observaciones

  	validates_numericality_of :puntaje, greater_than_or_equal_to: 0

  	pg_search_scope :search_by_full_escuela, associated_against: { escuela: [ :nombre, :razon_social] }, 
  					using:   {tsearch: { prefix: true }},
  					order_within_rank: " paso ASC,  estandar ASC"

	
	def puntos_objetivo
		puntos_totales_estandar = EstandarEtapaCertificacion.find_by(etapa_id: self.paso, estandar_id: self.estandar).puntaje_total 
		return puntos_totales_estandar
	end  					

end

 