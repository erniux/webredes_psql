class AddReferenceToCertificadors < ActiveRecord::Migration[5.2]
  def change
    add_reference :certificadors, :user, index: true
  end
end
