class CreateNoticia < ActiveRecord::Migration[5.2]
  def change
    create_table :noticia do |t|
      t.string :titulo
      t.text :detalle
      t.date :fecha
      t.string :autor

      t.timestamps
    end
  end
end
