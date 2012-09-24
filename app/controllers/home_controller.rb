class HomeController < ApplicationController
  def index
    if params[:q]
      @target_text = params[:q]

      # The sampler app asked for synchronous requests for some web calls.
      # In a production app, we would aim to use asynchronous for all web calls,
      # for example by using EventMachine::Iterator.new(urls, urls.length).
      @results = {
        "Weather Via Synchronous" => Services::Weather.search(@target_text),
        "Weather Via Asynchronous AMQP" => Services::WeatherViaAmqp.search(@target_text),
        "Google" => Services::Google.search(@target_text),
        "Yahoo" => Services::Yahoo.search(@target_text)
      }

      # Persist some information using ActiveRecord.
      # In a real app, we'd actually save e.g. the user id, search target, etc.
      Item.create!

    end
  end
end
