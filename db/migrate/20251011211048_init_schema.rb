class InitSchema < ActiveRecord::Migration[5.2]
  def change
    # Cargar el esquema actual directamente
    load Rails.root.join('db/schema.rb')
  end
end
