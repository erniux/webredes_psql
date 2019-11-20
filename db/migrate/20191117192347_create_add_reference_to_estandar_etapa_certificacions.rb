class CreateAddReferenceToEstandarEtapaCertificacions < ActiveRecord::Migration[5.2]
  def change
         add_reference :estandar_etapa_certificacions, :procesos, foreign_key: true
  end
end
