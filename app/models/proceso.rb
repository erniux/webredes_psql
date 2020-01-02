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

	after_create do
		total_procesos = Proceso.count - 1
		if total_procesos > 1
			proceso_base = self.anterior
			pasos = EtapaCertificacion.where(proceso_id: proceso_base.id)
			estandares = EstandarEtapaCertificacion.where(proceso_id: proceso_base.id)
			pasos.each do |paso|
				query = "INSERT INTO etapa_certificacions (nombre , descripcion, num_paso, proceso_id, created_at, updated_at) 
						 VALUES 
						 ('#{paso.nombre}', '#{paso.descripcion}', '#{paso.num_paso}', '#{self.id}', '#{Date.today}', '#{Date.today}')"
				EtapaCertificacion.connection.execute(query)          
			end	
			estandares.each do |estandar|
				query = "INSERT INTO estandar_etapa_certificacions (titulo , descripcion, observaciones, etapa_certificacion_id, evidencias, puntaje_total, num_estandar, num_etapa, proceso_id, created_at, updated_at) 
                		 VALUES 
                		('#{estandar.titulo}', '#{estandar.descripcion}', '#{estandar.observaciones}', '#{estandar.etapa_certificacion_id}', '#{estandar.evidencias}', '#{estandar.puntaje_total}' ,'#{estandar.num_estandar}', '#{estandar.num_etapa}', '#{self.id}', '#{Date.today}', '#{Date.today}')"
      			EstandarEtapaCertificacion.connection.execute(query)          
			end 
		else
			proceso_base = Proceso.first
			pasos = EtapaCertificacion.where(proceso_id: proceso_base.id) 
			estandares = EstandarEtapaCertificacion.where(procespo_id: proceso_base.id)
			pasos.each do |paso|
				query = "INSERT INTO etapa_certificacions (nombre , descripcion, num_paso, proceso_id, created_at, updated_at) 
							  VALUES 
							  ('#{paso.nombre}', '#{paso.descripcion}', '#{paso.num_paso}', '#{self.id}', '#{Date.today}', '#{Date.today}')"
				EtapaCertificacion.connection.execute(query)          
			end
			estandares.each do |estandar|
				query = "INSERT INTO estandar_etapa_certificacions (titulo , descripcion, observaciones, etapa_certificacion_id, evidencias, puntaje_total, num_estandar, num_etapa, proceso_id, created_at, updated_at) 
                		 VALUES 
                		('#{estandar.titulo}', '#{estandar.descripcion}', '#{estandar.observaciones}', '#{estandar.etapa_certificacion_id}', '#{estandar.evidencias}', '#{estandar.puntaje_total}' ,'#{estandar.num_estandar}', '#{estandar.num_etapa}', '#{self.id}', '#{Date.today}', '#{Date.today}')"
      			EstandarEtapaCertificacion.connection.execute(query)          
			end 
		end
	end

  	def etapa_periodo
    etapa_periodo =  self.periodo.to_s
    return etapa_periodo
  end

  def siguiente
	self.class.where("id > ?", id).first
  end

  def anterior
	self.class.where("id < ?", id).last
  end
	
end
