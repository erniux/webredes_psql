class AddReferenceToCertescolars < ActiveRecord::Migration[5.2]
  def change
    add_reference :cert_escolars, :certificador, index: true
  end
end
