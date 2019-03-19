class CreateAvisos < ActiveRecord::Migration[5.2]
  def change
    create_table :avisos do |t|
      t.string :titulo
      t.text :detalle
      t.datetime :fecha
      t.string :imagen

      t.timestamps
    end
  end
end
