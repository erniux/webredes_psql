class Proceso < ApplicationRecord
	has_many :etapa_certificacions 
	
	has_many :estandar_etapa_certificacions 

	accepts_nested_attributes_for :etapa_certificacions, reject_if: :all_blank, allow_destroy: true

	accepts_nested_attributes_for :estandar_etapa_certificacions 
	 
	enum estatus: {inicial: 0, en_proceso: 1, cerrado: 2} 

	validates_presence_of :periodo, :titulo, :estatus
	
	validates_uniqueness_of :periodo

	validates_numericality_of :periodo, greater_than_or_equal_to: 2019

	
end
