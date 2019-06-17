class CreateCertEscolars < ActiveRecord::Migration[5.2]
  def change
    create_table :cert_escolars do |t|
      t.integer :paso
      t.integer :estandar
      t.text :observaciones
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
