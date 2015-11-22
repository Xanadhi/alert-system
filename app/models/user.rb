class User < ActiveRecord::Base
  has_one :group
  has_many :alert_subscriptions
  has_many :alert_types, through: :alert_subscriptions
end
