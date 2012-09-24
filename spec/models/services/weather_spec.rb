require 'spec_helper'

describe Services::Weather do

  let(:target_text){ "Berkeley, CA" }
  let(:target_url_string){ "http://forecast.weather.gov/zipcity.php?inputstring=Berkeley,%20CA" }
  let(:response){ "my_response" }

  describe ".search(target)" do

    it "searches for the given target" do
      Services::Weather.should_receive(:search_impl).with(target_url_string, :at_xpath => Services::Weather.search_xpath).and_return(response)
      expect(Services::Weather.search target_text).to eq response
    end

  end

  describe ".search_url(target)" do

    it "returns the Weather-specific URL string to do a search with a given target" do
      expect(Services::Weather.search_url(target_text)).to eq target_url_string
    end

  end

  describe ".search_xpath" do

    it "returns the Weather-specific xpath string needed to extract the best search results" do
      expect(Services::Weather.search_xpath).to eq "//ul[@class='point-forecast-7-day']"
    end

  end

end
