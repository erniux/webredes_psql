class CreateDocReconocimientos < ActiveRecord::Migration[5.2]
  def change
    create_table :doc_reconocimientos do |t|
      t.string :titulo
      t.text :contenido
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
