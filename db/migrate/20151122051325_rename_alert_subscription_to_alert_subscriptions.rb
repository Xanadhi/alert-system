class RenameAlertSubscriptionToAlertSubscriptions < ActiveRecord::Migration
  def change
  	rename_table :alert_subscription, :alert_subscriptions
  end
end
