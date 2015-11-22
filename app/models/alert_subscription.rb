class AlertSubscription < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :alert_type, dependent: :destroy
end