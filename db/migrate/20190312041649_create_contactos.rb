class CreateContactos < ActiveRecord::Migration[5.2]
  def change
    create_table :contactos do |t|
      t.string :nombre
      t.string :telefono
      t.string :celular
      t.string :correo
      t.string :departamento

      t.timestamps
    end
  end
end
