class RenameTypeColumnInAlertTypes < ActiveRecord::Migration
  def change
  	rename_column :alert_types, :type, :name
  end
end
