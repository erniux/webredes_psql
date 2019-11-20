class CertEscolar < ApplicationRecord
	include PgSearch::Model
    
  #belongs_to :proceso_certificacion

	has_many_attached :evidencias

  	enum status: {sin_avance: 0, en_desarrollo: 1, revision: 2, revisado_con_comentarios: 3, cumplido: 4}

  	#validates_uniqueness_of :proceso, :scope => [:escuela_id, :paso, :estandar]

    before_update do |proceso| 
  		validates_presence_of :observaciones
  		validates_numericality_of :puntaje, greater_than_or_equal_to: 0
  	end

  	pg_search_scope :search_by_full_escuela, associated_against: { escuela: [ :nombre, :razon_social] }, 
  					using:   {tsearch: { prefix: true }},
  					order_within_rank: " paso ASC,  estandar ASC"

	
	def puntos_objetivo
		puntos_totales_estandar = EstandarEtapaCertificacion.find_by(num_etapa: self.paso, num_estandar: self.estandar).puntaje_total 
		return puntos_totales_estandar
	end  

  def self.nombre_escuela
    nombre_escuela = Escuela.where(id: self.escuela_id).first.nombre
  end					

end

 