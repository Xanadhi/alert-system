class AlertType < ActiveRecord::Base
	 has_many :users, through: :alert_subscriptions
end
