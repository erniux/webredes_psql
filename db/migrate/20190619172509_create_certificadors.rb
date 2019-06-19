class CreateCertificadors < ActiveRecord::Migration[5.2]
  def change
    create_table :certificadors do |t|
      t.string :nombre
      t.string :correo
      t.string :telefono

      t.timestamps
    end
  end
end
