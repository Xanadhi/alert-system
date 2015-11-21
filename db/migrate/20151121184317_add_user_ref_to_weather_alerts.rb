class AddUserRefToWeatherAlerts < ActiveRecord::Migration
  def change
    add_reference :weather_alerts, :user, index: true, foreign_key: true
  end
end
