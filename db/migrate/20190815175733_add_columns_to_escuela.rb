class AddColumnsToEscuela < ActiveRecord::Migration[5.2]
  def change
    add_column :escuelas, :nombre, :string
    add_column :escuelas, :razon_social, :string
    add_column :escuelas, :rfc, :string
    add_column :escuelas, :calle, :string
    add_column :escuelas, :numero, :string
    add_column :escuelas, :colonia, :string
    add_column :escuelas, :municipio, :string
    add_column :escuelas, :delegacion, :string
    add_column :escuelas, :ciudad, :string
    add_column :escuelas, :estado, :string
    add_column :escuelas, :cp, :string
    add_column :escuelas, :correo, :string
    add_column :escuelas, :telefono_oficina, :string
    add_column :escuelas, :sector, :string
    add_column :escuelas, :nivel_basico, :boolean
    add_column :escuelas, :nivel_media_superior, :boolean
    add_column :escuelas, :nivel_superior, :boolean
    add_column :escuelas, :nivel_capacitacion, :boolean
    add_column :escuelas, :nivel_escolar_especifico, :string
    add_column :escuelas, :num_grupos, :integer
    add_column :escuelas, :num_promedio_alumnos, :integer
    add_column :escuelas, :num_promedio_personal, :integer
    add_column :escuelas, :num_promedio_docentes, :integer

    remove_column :users, :rfc
    remove_column :users, :razon_social
    remove_column :users, :domicilio_fiscal
    remove_column :users, :domicilio_fisico
    remove_column :users, :sucursal
    remove_column :users, :telefono_oficina
    remove_column :users, :nombre_enlace
    remove_column :users, :appaterno_enlace
    remove_column :users, :apmaterno_enlace
    remove_column :users, :cargo_enlace
    remove_column :users, :correo_enlace
    remove_column :users, :telefono_enlace

  end
end
