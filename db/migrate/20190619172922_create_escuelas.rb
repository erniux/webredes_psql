class CreateEscuelas < ActiveRecord::Migration[5.2]
  def change
    create_table :escuelas do |t|
      t.string :nombre
      t.references :user, foreign_key: true
      t.references :certificador, foreign_key: true

      t.timestamps
    end
  end
end
