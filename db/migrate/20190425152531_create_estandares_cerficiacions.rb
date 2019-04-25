class CreateEstandaresCerficiacions < ActiveRecord::Migration[5.2]
  def change
    create_table :estandares_cerficiacions do |t|
      t.text :estandar
      t.text :descripcion
      t.float :puntos
      t.text :observaciones
      t.references :etapa_certificacions, foreign_key: true

      t.timestamps
    end
  end
end
