class HomeController < ApplicationController
  def index
    if params[:q]
      @target_text = params[:q]
      @results = {
        "Google" => Services::Google.search(@target_text),
        "Yahoo" => Services::Yahoo.search(@target_text)
      }
    end
  end
end
