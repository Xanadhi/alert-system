class CreateWeatherAlerts < ActiveRecord::Migration
  def change
    create_table :weather_alerts do |t|

      t.timestamps null: false
    end
  end
end
