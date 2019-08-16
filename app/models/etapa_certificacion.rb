class EtapaCertificacion < ApplicationRecord
	before_destroy :no_referenced_estandar_etapa_certificacions 


	has_many :estandar_etapa_certificacions, :dependent => :destroy  
	has_many :puntos_estandars, :dependent => :destroy 



	accepts_nested_attributes_for :estandar_etapa_certificacions, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :puntos_estandars, reject_if: :all_blank, allow_destroy: true

	def no_referenced_estandar_etapa_certificacions
    	return if estandar_etapa_certificacions.empty?
    	errors.add :base,  "No se permite hay ..."
    	false # If you return anything else, the callback will not stop the destroy from happening
  	end

    def total_puntos(paso)
      EstandarEtapaCertificacion.group(:etapa_certificacion_id).having("etapa_certificacion_id = ?", paso).sum(:puntaje_total).sum
    end
  		
end

