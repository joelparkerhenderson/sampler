#!/usr/bin/env ruby
# encoding: utf-8

require 'amqp'

@result = "none"

AMQP.start do |connection|
  Signal.trap("INT") { connection.close { EventMachine.stop { exit } } }
  #puts "To exit press CTRL+C"

  channel  = AMQP::Channel.new(connection)
  queue = channel.queue("", :exclusive => true, :auto_delete => true)
  exchange = channel.default_exchange

  ### Receive response
  queue.subscribe do |metadata, payload|
    puts "[response] Client received a response for #{metadata.correlation_id}: #{payload.inspect}"
    @result = payload
    connection.close { EventMachine.stop }
  end

  ### Send request
  EventMachine.add_periodic_timer(1.0) do
    payload = "Berkeley, CA"
    routing_key = "sampler.weather"
    message_id = Kernel.rand(10101010).to_s
    reply_to = queue.name
    puts "[request] Client is sending a request: routing_key:#{routing_key} message_id:#{message_id} reply_to:#{reply_to} payload:#{payload}"
    exchange.publish(payload,
                     :routing_key => routing_key,
                     :message_id  => message_id,
                     :reply_to    => reply_to,
                     :immediate   => true
                     )
  end

end
