class CreateAcercades < ActiveRecord::Migration[5.2]
  def change
    create_table :acercades do |t|
      t.text :descripcion

      t.timestamps
    end
  end
end
