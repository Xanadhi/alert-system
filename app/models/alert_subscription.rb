class AlertSubscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :alert_type
end