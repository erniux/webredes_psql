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
  	 	estandares.each  do |estandar|
  	 		puts "ESTANDAR QUE SE INGRESA A LA TABLA ----- " + estandar.inspect	
  	 		crear_certificacion = CertEscolar.create!(proceso: proceso_str, estandar: estandar.num_estandar, paso: estandar.etapa_certificacion.num_paso, 
                               escuela_id: escuela, puntaje: 0, observaciones: "inicial")
  	 		#if crear_certificacion.new_record? 
  	 		#	puts '*********** estoy dentro del if **********'
  	 		#	crear_certificacion.save
  	 		#	crear_certificacion.committed!
  	 		#	puts "commited a ! "
  	 		#end
         end
  	 end

end
