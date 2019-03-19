class AddColumToNoticia < ActiveRecord::Migration[5.2]
  def change
    add_column :noticia, :imagen, :string
  end
end
