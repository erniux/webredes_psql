class ChangeColumnToAcercades < ActiveRecord::Migration[5.2]
  def change
  	rename_column :acercades, :descripcion, :desc_titulo_1 
  	rename_column :acercades, :mision, :desc_titulo_2 
  	rename_column :acercades, :vision, :desc_titulo_3 
  	rename_column :acercades, :valores, :desc_titulo_4 
  	rename_column :acercades, :que_somos, :desc_titulo_5 
  	rename_column :acercades, :que_hacemos, :desc_titulo_6 
  	rename_column :acercades, :que_buscamos, :desc_titulo_7 
  	rename_column :acercades, :enfoque, :desc_titulo_8 
  	rename_column :acercades, :importancia, :desc_titulo_9 
  	rename_column :acercades, :porque_socio, :desc_titulo_10 


  	add_column :acercades, :tit_titulo_1, :text
  	add_column :acercades, :tit_titulo_2, :text
  	add_column :acercades, :tit_titulo_3, :text
  	add_column :acercades, :tit_titulo_4, :text
  	add_column :acercades, :tit_titulo_5, :text
  	add_column :acercades, :tit_titulo_6, :text
  	add_column :acercades, :tit_titulo_7, :text
  	add_column :acercades, :tit_titulo_8, :text
  	add_column :acercades, :tit_titulo_9, :text
  	add_column :acercades, :tit_titulo_10, :text

  	change_column :acercades, :desc_titulo_2, :text
	change_column :acercades, :desc_titulo_3, :text 
	change_column :acercades, :desc_titulo_4, :text 
  end
end
