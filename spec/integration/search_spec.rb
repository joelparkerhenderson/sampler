# -*- coding: utf-8 -*-
require 'spec_helper'

describe "Search" do

  before do
    @target = "Berkeley, CA"
    visit root_path
    fill_in "Search", :with => @target
    click_on "Search"
  end

  it "has a 'Home' headline" do
    page.should have_xpath("//h1", :text => "Home")
  end

  it "has a results headlines" do
    ["Google Results", "Yahoo Results"].each{|h1|
      page.should have_xpath("//h1", :text => h1)
    }
  end

end
