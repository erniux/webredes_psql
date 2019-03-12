class CreatePrecios < ActiveRecord::Migration[5.2]
  def change
    create_table :precios do |t|
      t.string :plan
      t.string :descripcion
      t.float :precio

      t.timestamps
    end
  end
end
