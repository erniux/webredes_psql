class CertEscolar < ApplicationRecord

  enum status: {activa: 0, aceptada: 1, rechazada: 2}		
  
  belongs_to :user

  has_many_attached :evidencias

  def self.nombre_escuela(escuela_id)
  	User.where(id: :escuela_id) 
  end

end
