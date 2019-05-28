class EtapaCertificacion < ApplicationRecord
	has_many :estandar_etapa_certificacions
	accepts_nested_attributes_for :estandar_etapa_certificacions, allow_destroy: true
end

