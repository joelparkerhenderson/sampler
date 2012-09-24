# -*- coding: utf-8 -*-
require 'spec_helper'

describe "Home Page" do

  it "has a 'Home' headline" do
    visit '/'
    page.should have_xpath("//h1", :text => "Home")
  end


  it "has a search form" do
    visit '/'
    page.should have_xpath("//form")
  end

end
