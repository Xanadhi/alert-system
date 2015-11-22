class AlertType < ActiveRecord::Base
	has_many :alert_subscriptions
	has_many :users, through: :alert_subscriptions
end
