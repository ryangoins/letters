class RenameColumn < ActiveRecord::Migration
  def change
  	rename_column :Letters, :recipient_last_name, :recipient_last_name
  end
end
