class HomeController < ApplicationController
  def index
    if params[:q]
      @target = params[:q]
      @results = "coming soon"
    end
  end
end
