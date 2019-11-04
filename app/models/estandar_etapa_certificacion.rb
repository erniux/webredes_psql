class EstandarEtapaCertificacion < ApplicationRecord
	before_destroy :no_referenced_puntos_estandars 
	belongs_to :etapa_certificacion 

	has_many :puntos_estandars, :dependent => :destroy 

	validates_presence_of :titulo, :descripcion, :observaciones, :etapa_certificacion_id, :puntaje_total, :estandar_id 
  
  	validates_uniqueness_of :etapa_id, :scope => :estandar_id 


	accepts_nested_attributes_for :puntos_estandars, reject_if: :all_blank, allow_destroy: true

	has_many_attached :obligatorio
	has_many_attached :apoyo

	def no_referenced_puntos_estandars
    	return if puntos_estandars.empty?
    	errors.add :base,  "No se permite hay ..."
    	false # If you return anything else, the callback will not stop the destroy from happening
  	end
end


