class CreateConatctos < ActiveRecord::Migration[5.2]
  def change
    create_table :contactos do |t|
      t.string :nombre
      t.string :correo
      t.text :asunto
      t.text :comentarios

      t.timestamps
    end
  end
end
