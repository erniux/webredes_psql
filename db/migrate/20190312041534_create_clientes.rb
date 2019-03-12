class CreateClientes < ActiveRecord::Migration[5.2]
  def change
    create_table :clientes do |t|
      t.string :nombre
      t.string :rfc
      t.string :responsable
      t.string :telefono
      t.string :correo

      t.timestamps
    end
  end
end
