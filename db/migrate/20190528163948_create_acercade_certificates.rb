class CreateAcercadeCertificates < ActiveRecord::Migration[5.2]
  def change
    create_table :acercade_certificates do |t|
      t.text :tit_titulo_1
      t.text :tit_titulo_2
      t.text :tit_titulo_3
      t.text :tit_titulo_4
      t.text :tit_titulo_5
      t.text :tit_titulo_6
      t.text :tit_titulo_7
      t.text :tit_titulo_8
      t.text :tit_titulo_9
      t.text :tit_titulo_10
      t.text :desc_titulo_1
      t.text :desc_titulo_2
      t.text :desc_titulo_3
      t.text :desc_titulo_4
      t.text :desc_titulo_5
      t.text :desc_titulo_6
      t.text :desc_titulo_7
      t.text :desc_titulo_8
      t.text :desc_titulo_9
      t.text :desc_titulo_10
      t.string :imagen_encabezado

      t.timestamps
    end
  end
end
