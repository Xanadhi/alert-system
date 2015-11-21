class DropWeatherAlerts < ActiveRecord::Migration
  def change
    drop_table :weather_alerts
  end
end
