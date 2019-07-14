class CertEscolar < ApplicationRecord

  enum status: {creado: 0, revision: 1, revisado_con_comentarios: 2, cumplido: 3}
  
  belongs_to :user
  has_many_attached :evidencias

end