class AddReferenceToPuntosEstandar < ActiveRecord::Migration[5.2]
  def change
    add_reference :puntos_estandars, :etapa_certificacion, foreign_key: true
  end
end
