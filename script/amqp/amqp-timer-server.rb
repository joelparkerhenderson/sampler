#!/usr/bin/env ruby
# encoding: utf-8

require 'amqp'

AMQP.start do |connection|
  Signal.trap("INT") { connection.close { EventMachine.stop { exit } } }
  puts "To exit press CTRL+C"

  channel  = AMQP::Channel.new(connection)
  queue = channel.queue("foo.timer", :exclusive => true, :auto_delete => true)
  exchange = channel.default_exchange

  queue.subscribe(:ack => true) do |metadata, payload|
    routing_key = metadata.reply_to
    correlation_id = metadata.message_id
    puts "[requests] Got a request #{metadata.message_id}. Sending a reply. routing_key:#{routing_key} correlation_id:#{correlation_id}"
    exchange.publish(Time.now.to_s,
                     :routing_key    => metadata.reply_to,
                     :correlation_id => metadata.message_id,
                     :immediate      => true,
                     :mandatory      => true
                     )
    metadata.ack
  end

end
