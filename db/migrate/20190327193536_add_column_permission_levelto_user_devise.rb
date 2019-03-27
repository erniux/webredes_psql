class AddColumnPermissionLeveltoUserDevise < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :permission_level, :integer, :null => false, :default => 0
  end
end
