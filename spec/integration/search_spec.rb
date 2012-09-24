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
    page.should have_xpath("//h1", :text => "Results")
  end

  it "has a 'Results' headline" do
    page.should have_xpath("//h1", :text => "Results")
  end

  it "shows the search target" do
    page.should have_content(@target)
  end

end
