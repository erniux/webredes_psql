class AddColumnToAcercades < ActiveRecord::Migration[5.2]
  def change
  	add_column :acercades, :que_somos, :text
  	add_column :acercades, :que_hacemos, :text
  	add_column :acercades, :que_buscamos, :text
  	add_column :acercades, :enfoque, :text
  	add_column :acercades, :importancia, :text
  end
end
