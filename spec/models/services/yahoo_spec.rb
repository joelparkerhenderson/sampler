require 'spec_helper'

describe Services::Yahoo do

  let(:target_text){ "Berkeley, CA" }
  let(:target_url_string){ "http://search.yahoo.com/search?p=Berkeley,%20CA" }
  let(:response){ "my_response" }

  describe ".search(target)" do

    it "searches for the given target" do
      Services::Yahoo.should_receive(:search_impl).with(target_url_string, :at_xpath => Services::Yahoo.search_xpath, :remove_xpath => ".//img").and_return(response)
      expect(Services::Yahoo.search target_text).to eq response
    end

  end

  describe ".search_url(target)" do

    it "returns the Yahoo-specific URL string to do a search with a given target" do
      expect(Services::Yahoo.search_url(target_text)).to eq target_url_string
    end

  end

  describe ".search_xpath" do

    it "returns the Yahoo-specific xpath string needed to extract the best search results" do
      expect(Services::Yahoo.search_xpath).to eq "//div[@id='left']"
    end

  end

end
