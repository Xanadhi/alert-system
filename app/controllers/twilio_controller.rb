require 'twilio-ruby'
require 'pry'
require 'alert_transaction'
require 'message_parsing'

class TwilioController < ApplicationController
  # include Webhookable

#   after_filter :set_header
#  
#   skip_before_action :verify_authenticity_token


  @@messages = []

  def index
  end

  def send_sms

    # number_to_send_to = params[:number].to_i
    # message = params[:body]
    # travel_time = params[:travelTime]

    twilio_phone_number = "2892781799"
    current_time = Time.now
    @twilio_client = Twilio::REST::Client.new(Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token)
    @twilio_client.account.messages.create({
      :from => "+1#{twilio_phone_number}",
      :to => 6479625447,
      :body => "Testing out Twilio SMS at #{current_time}"
    })
    redirect_to alerts_url
  end

  def receive_sms

    body = params[:Body].upcase
    senderNumber = params[:From]
    # delivery = Delivery.where(["number LIKE ?", "#{senderNumber}"]).first
    # senderName = delivery.name
    # senderAddress = delivery.address
    twilio_phone_number = "2892781799"
      twiml = Twilio::TwiML::Response.new do |r|
        r.Message "Thank you for your message <3"     
    end
    render :text => twiml.text, :content_type => "text/xml"

    puts "Received sms #{body}"
    MessageParser.parse(body, senderNumber)
    puts "Done Parse"

  end

  def check_messages
    @messages = @@messages
    #binding.pry
  end

  private
  def notify_driver(message)
    @@messages << message
    #binding.pry
  end

end
