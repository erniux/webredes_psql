class AddColumnsToEscuelaEnlace < ActiveRecord::Migration[5.2]
  def change
  	add_column :escuelas, :nombre_enlace, :string
  	add_column :escuelas, :appaterno_enlace, :string
  	add_column :escuelas, :apmaterno_enlace, :string
  	add_column :escuelas, :cargo_enlace, :string
  	add_column :escuelas, :asignacion_actual_enlace, :string
  	add_column :escuelas, :correo_enlace, :string
  	add_column :escuelas, :telefono_enlace, :string

  end
end
