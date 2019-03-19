class DropTableNoticia < ActiveRecord::Migration[5.2]
  def change
  	drop_table :noticia
  end
end
