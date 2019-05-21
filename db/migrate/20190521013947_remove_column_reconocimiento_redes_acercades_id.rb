class RemoveColumnReconocimientoRedesAcercadesId < ActiveRecord::Migration[5.2]
  def change
  	remove_reference :reconocimiento_redes, :acercades, index: true, foreign_key: true

  end
end
