class HomeController < ApplicationController
  def index
    if params[:q]
      @target_text = params[:q]
      @results = Services::Google.search(@target_text)
    end
  end
end
