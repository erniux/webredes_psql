class Proceso < ApplicationRecord
	before_destroy :no_referenced_procesos
	 
	has_many :etapa_certificacions, :dependent => :destroy  
	has_many :estandar_etapa_certificacions, :dependent => :destroy 
	has_many :proceso_certificacions, :dependent => :destroy

	accepts_nested_attributes_for :etapa_certificacions, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :estandar_etapa_certificacions 
	 
	enum estatus: {desarrollo: 0, cerrado: 1} 

	validates_presence_of :periodo, :titulo, :estatus
	
	validates_uniqueness_of :periodo

	#validates_numericality_of :periodo, greater_than_or_equal_to: 2019
	validates :periodo, length: { is: 6 , message: "Formato: AAAA-PP" }

	def no_referenced_procesos 
		#return if !proceso_certificacions.empty?  
    	#	 errors.add :base, :invalid
    	#false # If you return anything else, the callback will not stop the destroy from happening
  	end

  	def etapa_periodo
    etapa_periodo =  self.periodo.to_s
    puts '*************+ etapa_periodo de etapa_certificacion.rb ***** ' + etapa_periodo
    return etapa_periodo
  end

	
end
