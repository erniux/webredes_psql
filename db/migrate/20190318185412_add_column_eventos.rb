class AddColumnEventos < ActiveRecord::Migration[5.2]
  def change
  	add_column :eventos, :imagen, :string
  	rename_column :eventos, :expòsitor, :expositor
  end
end
