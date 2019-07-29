class CertEscolar < ApplicationRecord
	include PgSearch::Model

	belongs_to :user

  	enum status: {sin_avance: 0, en_desarrollo: 1, revision: 2, revisado_con_comentarios: 3, cumplido: 4}

  	validates_presence_of :observaciones

  	pg_search_scope :search_by_full_escuela, associated_against: { user: [:id, :razon_social] }, 
  					using:   {tsearch: { prefix: true }}


  	has_many_attached :evidencias

end
