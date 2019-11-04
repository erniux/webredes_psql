class CreateProcesos < ActiveRecord::Migration[5.2]
  def change
    create_table :procesos do |t|
      t.integer :periodo
      t.integer :estatus
      t.string :titulo

      t.timestamps
    end
     add_reference :etapa_certificacions, :proceso, foreign_key: true
  end

    
end
