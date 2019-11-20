class EtapaCertificacion < ApplicationRecord
	before_destroy :no_referenced_estandar_etapa_certificacions 

  belongs_to :proceso
	
  has_many :estandar_etapa_certificacions, :dependent => :destroy  
	has_many :puntos_estandars, :dependent => :destroy 

  validates_presence_of :num_paso, :nombre, :descripcion, :proceso_id
  
  validates_uniqueness_of :num_paso, :scope => :proceso_id
   

	accepts_nested_attributes_for :estandar_etapa_certificacions, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :puntos_estandars, reject_if: :all_blank, allow_destroy: true

	def no_referenced_estandar_etapa_certificacions
    return if estandar_etapa_certificacions.empty?
    errors.add :base,  "No se permite hay ..."
    false # If you return anything else, the callback will not stop the destroy from happening
  end

  def total_puntos(paso)
    total = EstandarEtapaCertificacion.group(:num_etapa).having("num_etapa = ?", paso).sum(:puntaje_total)
    return total[paso]
  end

  def total_certificacion
    total = EstandarEtapaCertificacion.sum(:puntaje_total)
    return total
  end 

  def etapa_periodo
    etapa_periodo = self.num_paso.to_s + '-' + self.proceso.periodo.to_s
    return etapa_periodo
  end

  def periodo
    periodo =  self.proceso.periodo.to_s
    return periodo
  end

  def titulo_modelo
      self.nombre.truncate(25) + '...' if !nombre.blank?
    end
  		
end

