class AddColumnToEventos < ActiveRecord::Migration[5.2]
  def change
    add_column :eventos, :imagen_2, :bytea
  end
end
