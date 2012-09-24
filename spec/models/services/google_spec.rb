require 'spec_helper'

describe Services::Google do

  let(:target_text){ "Berkeley, CA" }
  let(:target_url_string){ "http://www.google.com/search?q=Berkeley,%20CA" }
  let(:response){ "my_response" }

  describe ".search(target)" do

    it "searches for the given target" do
      Services::Google.should_receive(:search_impl).with(target_url_string, :at_xpath => Services::Google.search_xpath, :remove_xpath => ".//img").and_return(response)
      expect(Services::Google.search target_text).to eq response
    end

  end

  describe ".search_url(target)" do

    it "returns the Google-specific URL string to do a search with a given target" do
      expect(Services::Google.search_url(target_text)).to eq target_url_string
    end

  end

  describe ".search_xpath" do

    it "returns the Google-specific xpath string needed to extract the best search results" do
      expect(Services::Google.search_xpath).to eq "//div[@id='search']"
    end

  end

end
