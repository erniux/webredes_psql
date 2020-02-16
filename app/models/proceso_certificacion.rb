class ProcesoCertificacion < ApplicationRecord
  #has_many :cert_escolars
  #belongs_to :escuela

	def proceso_periodo
		proceso = Proceso.where(id: self.proceso_id).first.periodo
	end

	validates_uniqueness_of :escuela_id, :scope => :proceso_id


	after_create do |proceso|
  	estandares = EstandarEtapaCertificacion.where(proceso_id: proceso_id)
  	proceso_str = Proceso.where(id: proceso_id).first.periodo
  	escuela = proceso.escuela_id 
  	estandares.each do |estandar|
      query = "INSERT INTO cert_escolars (proceso , estandar, paso, escuela_id, puntaje, observaciones, proceso_certificacion_id, created_at, updated_at) 
                VALUES 
                ('#{proceso_str}', '#{estandar.num_estandar}', '#{estandar.etapa_certificacion.num_paso}', '#{escuela}', 0, 'inicial', '#{id}', '#{Date.today}', '#{Date.today}')"
      CertEscolar.connection.execute(query)          
    end
  end

    before_destroy do |proceso|
      puts "TOY EN EL BEFORE DESTROY Escuela " + proceso.escuela_id.to_s + ' Proceso **** ' + proceso_id.to_s   
      certificacion = CertEscolar.where(escuela_id: proceso.escuela_id, proceso_certificacion_id: proceso.id)
      if !certificacion.nil?
        puts "BORRANDO CERT_ESCOLAR"
        puts certificacion.inspect
        certificacion.destroy_all
      end
    end   

    def nombre_escuela 
      if !self.escuela_id.blank?
        nombre_escuela = Escuela.where(id: self.escuela_id).first.nombre 
      end
    end

end


 