#!/usr/bin/env ruby
# encoding: utf-8

require 'amqp'

AMQP.start do |connection|
  channel  = AMQP::Channel.new(connection)
  queue = channel.queue("foo")

  Signal.trap("INT") do
    connection.close do
      EM.stop { exit }
    end
  end

  puts " [*] Waiting for messages. To exit press CTRL+C"

  queue.subscribe do |payload|
    puts " [x] Received #{payload}"
  end
end
