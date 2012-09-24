#!/usr/bin/env ruby
# encoding: utf-8

require 'amqp'
require 'httparty'
require 'nokogiri'
require 'uri'

AMQP.start do |connection|
  Signal.trap("INT") { connection.close { EventMachine.stop { exit } } }
  puts "To exit press CTRL+C"

  channel  = AMQP::Channel.new(connection)
  queue = channel.queue("sampler.weather", :exclusive => true, :auto_delete => true)
  exchange = channel.default_exchange

  queue.subscribe(:ack => true) do |metadata, payload|
    routing_key = metadata.reply_to
    correlation_id = metadata.message_id
    puts "[requests] Got a request #{metadata.message_id}. Sending a reply. routing_key:#{routing_key} correlation_id:#{correlation_id} payload:#{payload}"

    # Connect to the U.S. weather service to request the data.
    # If this were a production app, we would use a model of a weather service,
    # similar to how we do this app's model of a Google service and Yahoo service.
    # This code is explicitly separated from the Rails app to run independently.
    url = "http://forecast.weather.gov/zipcity.php?inputstring=#{URI.escape(payload)}"
    html = Nokogiri::HTML(HTTParty.get(url)).at_xpath("//ul[@class='point-forecast-7-day']").to_s

    exchange.publish(html,
                     :routing_key    => metadata.reply_to,
                     :correlation_id => metadata.message_id,
                     :immediate      => true,
                     :mandatory      => true
                     )
    metadata.ack
  end

end
