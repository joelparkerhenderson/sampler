#!/usr/bin/env ruby
require 'amqp'

AMQP.start do |connection|
  channel  = AMQP::Channel.new(connection)
  queue = channel.queue("foo")
  exchange = channel.default_exchange

  exchange.publish "Hello, world!", :routing_key => queue.name

  EM.add_timer(0.5) do
    connection.close do
      EM.stop { exit }
    end
  end

end
