require 'spec_helper'

describe Services::Google do

  describe ".search_url(target)" do

    it "returns the Google-specific URL string to do a search with a given target" do
      expect(Services::Google.search_url("Berkeley, CA")).to eq "http://www.google.com/search?q=Berkeley,%20CA"
    end

  end

end
