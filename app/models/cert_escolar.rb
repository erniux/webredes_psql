class CertEscolar < ApplicationRecord

  enum status: {activa: 0, aceptada: 1, rechazada: 2}		
  belongs_to :user

  validates_presence_of :paso, :estandar, :observaciones

  has_many_attached :evidencias

end
