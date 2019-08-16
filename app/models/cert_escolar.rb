class CertEscolar < ApplicationRecord
	include PgSearch::Model

	belongs_to :escuela

  	enum status: {sin_avance: 0, en_desarrollo: 1, revision: 2, revisado_con_comentarios: 3, cumplido: 4}

  	validates_presence_of :observaciones

  	pg_search_scope :search_by_full_escuela, associated_against: { escuela: [ :nombre, :razon_social] }, 
  					using:   {tsearch: { prefix: true }},
  					order_within_rank: " paso ASC,  estandar ASC"


  	has_many_attached :evidencias

end
