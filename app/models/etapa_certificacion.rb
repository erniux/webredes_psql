class EtapaCertificacion < ApplicationRecord
	has_many :estandar_etapa_certificacion
	accepts_nested_attributes_for :estandar_etapa_certificacion, allow_destroy: true
end

