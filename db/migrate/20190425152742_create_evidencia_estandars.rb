class CreateEvidenciaEstandars < ActiveRecord::Migration[5.2]
  def change
    create_table :evidencia_estandars do |t|
      t.text :nombre_documento
      t.string :tipo_documento
      t.references :estandares_cerficiacions, foreign_key: true

      t.timestamps
    end
  end
end
