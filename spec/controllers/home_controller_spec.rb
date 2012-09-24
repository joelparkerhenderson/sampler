# -*- coding: utf-8 -*-
require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do

    it "returns http success" do
      get 'index'
      response.should be_success
      response.should render_template("index")
    end

    it "returns http success" do
      get 'index', :q => "my_search"
      response.should be_success
      response.should render_template("index")
    end
  end

end
