class DropClientesContactos < ActiveRecord::Migration[5.2]
  def change
  	drop_table :clientes
  	drop_table :contactos
  end
end
