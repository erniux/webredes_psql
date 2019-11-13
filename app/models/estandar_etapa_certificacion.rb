class EstandarEtapaCertificacion < ApplicationRecord
    before_destroy :no_referenced_puntos_estandars 
	
	belongs_to :etapa_certificacion 
	 

	has_many :puntos_estandars, :dependent => :destroy 

	validates_presence_of :titulo, :descripcion, :observaciones, :evidencias, :etapa_certificacion_id, :puntaje_total, :num_estandar
  
  	validates_uniqueness_of :num_estandar, :scope => :num_etapa

	accepts_nested_attributes_for :puntos_estandars, reject_if: :all_blank, allow_destroy: true

	has_many_attached :obligatorio
	has_many_attached :apoyo

	attr_accessor :remove_obligatorio, :remove_apoyo
	
	after_save do
		Array(remove_obligatorio).each { |id| obligatorio.find_by_id(id).try(:purge) }
		Array(remove_apoyo).each { |id| apoyo.find_by_id(id).try(:purge) }
	end

	def obligatorio_filename
		obligatorio.map {|p| p.filename.to_s}
	end

	def no_referenced_puntos_estandars
    	return if puntos_estandars.empty?
    	errors.add :base,  "No se permite hay ..."
    	false # If you return anything else, the callback will not stop the destroy from happening
  	end
 
end


 


