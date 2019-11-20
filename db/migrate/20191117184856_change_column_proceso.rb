class ChangeColumnProceso < ActiveRecord::Migration[5.2]
  def change
  	change_column :procesos, :periodo, :string
  end
end
