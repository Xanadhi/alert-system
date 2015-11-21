require 'twilio-ruby'
require 'pry'

class TwilioController < ApplicationController
  # include Webhookable

#   after_filter :set_header
#  
#   skip_before_action :verify_authenticity_token

  @@messages = []

  def index
  end

  def sendsms
    number_to_send_to = params[:number].to_i
    message = params[:message]
    travel_time = params[:travelTime]
    twilio_phone_number = "2892781799"
    @twilio_client = Twilio::REST::Client.new(Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token)
    @twilio_client.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => number_to_send_to,
      :body => "Hey there!"
    )
    # redirect_to deliveries_url
  end

  def receivesms
    body = params[:Body].upcase
    senderNumber = params[:From]
    # delivery = Delivery.where(["number LIKE ?", "#{senderNumber}"]).first
    # senderName = delivery.name
    # senderAddress = delivery.address
    twilio_phone_number = "2892781799"
      twiml = Twilio::TwiML::Response.new do |r|
        r.Message "Thank you for letting us know, we'll make sure the driver is notified."
        # @twilio_client = Twilio::REST::Client.new(Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token)
        #   @twilio_client.messages.create(
        #   :from => "+1#{twilio_phone_number}",
        #   :to => 6044013954,
        #   :body => "#{senderName} (#{senderAddress}) is unavailable for pick-up."
        #   )
        # notifyDriver("Customer is not available.")

    
      
    end
    render :text => twiml.text, :content_type => "text/xml"
  end

  def checkmessages
    @messages = @@messages
    #binding.pry
  end

  private
  def notifyDriver(message)
    @@messages << message
    #binding.pry
  end

end
