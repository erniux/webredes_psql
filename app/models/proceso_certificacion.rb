class ProcesoCertificacion < ApplicationRecord
  #has_many :cert_escolars
  #belongs_to :escuela

	def proceso_periodo
		proceso = Proceso.where(id: self.proceso_id).first.periodo
	end

	validates_uniqueness_of :escuela_id, :scope => :proceso_id

	after_create do |proceso|
  	 	estandares = EstandarEtapaCertificacion.where(proceso_id: proceso_id)
      puts '******* estandares del nuevo proceso ' + estandares.inspect.to_s + ' ******************'
  	 	proceso_str = Proceso.where(id: proceso_id).first.periodo
      puts '****************** del proceso_str **** ' + proceso_str.to_s 
  	 	escuela = proceso.escuela_id 
  	 	estandares.each do |estandar|
  	 		puts "ESTANDAR QUE SE INGRESA A LA TABLA ----- " + estandar.inspect	
        query = "INSERT INTO cert_escolars (proceso , estandar, paso, escuela_id, puntaje, observaciones, created_at, updated_at) 
                  VALUES 
                  ('#{proceso_str}', '#{estandar.num_estandar}', '#{estandar.etapa_certificacion.num_paso}', '#{escuela}', 0, 'inicial', '#{Date.today}', '#{Date.today}')"
        CertEscolar.connection.execute(query)          
  	 		#crear_certificacion = CertEscolar.create!(proceso: proceso_str, estandar: estandar.num_estandar, paso: estandar.etapa_certificacion.num_paso, 
        #                       escuela_id: escuela, puntaje: 0, observaciones: "inicial")
  	 		#if crear_certificacion.new_record? 
  	 		#	puts '*********** estoy dentro del if **********'
  	 		#	crear_certificacion.save
  	 		#	crear_certificacion.committed!
  	 		#	puts "commited a ! "
  	 		#end
         end
  	 end

end
