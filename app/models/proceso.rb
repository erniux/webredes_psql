class Proceso < ApplicationRecord
	has_many :etapa_certificacions, :dependent => :destroy  
	has_many :estandar_etapa_certificacions, :dependent => :destroy 
	has_many :proceso_certificacions, :dependent => :destroy

	accepts_nested_attributes_for :etapa_certificacions, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :estandar_etapa_certificacions 
	 
	enum estatus: {desarrollo: 0, cerrado: 1} 

	validates_presence_of :periodo, :titulo, :estatus
	
	validates_uniqueness_of :periodo

	validates :periodo, length: { is: 6 , message: "Formato: AAAA-PP" }

  	def etapa_periodo
    etapa_periodo =  self.periodo.to_s
    puts '*************+ etapa_periodo de etapa_certificacion.rb ***** ' + etapa_periodo
    return etapa_periodo
  end

	
end
