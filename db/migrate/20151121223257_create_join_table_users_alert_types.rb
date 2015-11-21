class CreateJoinTableUsersAlertTypes < ActiveRecord::Migration
  def change
    create_join_table :users, :alert_types, table_name: :alert_subscription do |t|
      t.index [:alert_type_id, :user_id]
    end
  end
end
