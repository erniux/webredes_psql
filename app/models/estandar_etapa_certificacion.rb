class EstandarEtapaCertificacion < ApplicationRecord
	belongs_to :etapa_certificacion

	has_many_attached :obligatorio
	has_many_attached :apoyo


end
