class WeatherAlertsController < ApplicationController
  before_action :set_weather_alert, only: [:show, :edit, :update, :destroy]

  # GET /weather_alerts
  # GET /weather_alerts.json
  def index
    @weather_alerts = WeatherAlert.all
  end

  # GET /weather_alerts/1
  # GET /weather_alerts/1.json
  def show
  end

  # GET /weather_alerts/new
  def new
    @weather_alert = WeatherAlert.new
  end

  # GET /weather_alerts/1/edit
  def edit
  end

  # POST /weather_alerts
  # POST /weather_alerts.json
  def create
    @weather_alert = WeatherAlert.new(weather_alert_params)

    respond_to do |format|
      if @weather_alert.save
        format.html { redirect_to @weather_alert, notice: 'Weather alert was successfully created.' }
        format.json { render :show, status: :created, location: @weather_alert }
      else
        format.html { render :new }
        format.json { render json: @weather_alert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weather_alerts/1
  # PATCH/PUT /weather_alerts/1.json
  def update
    respond_to do |format|
      if @weather_alert.update(weather_alert_params)
        format.html { redirect_to @weather_alert, notice: 'Weather alert was successfully updated.' }
        format.json { render :show, status: :ok, location: @weather_alert }
      else
        format.html { render :edit }
        format.json { render json: @weather_alert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weather_alerts/1
  # DELETE /weather_alerts/1.json
  def destroy
    @weather_alert.destroy
    respond_to do |format|
      format.html { redirect_to weather_alerts_url, notice: 'Weather alert was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weather_alert
      @weather_alert = WeatherAlert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weather_alert_params
      params[:weather_alert]
    end
end
