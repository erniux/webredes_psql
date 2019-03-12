class CreateRecursos < ActiveRecord::Migration[5.2]
  def change
    create_table :recursos do |t|
      t.string :nombre
      t.string :user

      t.timestamps
    end
  end
end
