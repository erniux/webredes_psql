class CreateProcesoCertificacions < ActiveRecord::Migration[5.2]
  def change
    create_table :proceso_certificacions do |t|
      t.references :escuela, foreign_key: true
      t.references :proceso, foreign_key: true

      t.timestamps
    end
  end
end
