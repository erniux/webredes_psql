class RemoveColumnToCertEscolars < ActiveRecord::Migration[5.2]
  def change
  	remove_index "cert_escolars", name: "index_cert_escolars_on_certificador_id"
  end
end
