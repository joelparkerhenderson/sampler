require 'spec_helper'

describe Services::WeatherViaAmqp do

  let(:target_text){ "Berkeley, CA" }

  describe ".search(target)" do

    it "searches for the given target and returns results comparable to the synchronous strategy" do
      x = Services::WeatherViaAmqp.search(target_text)
      # TODO this will be a good test to write, because it will need to ensure enough predictions,
      # and more importantly will need to match the synchronous strategy (which sometimes may have
      # slightly-different content because the synchronous is called at a slightly-different time).
      # For now, we just smoke-test that it's a Nokogiri doc and has a plausible size.
      expect(x).to be_a_kind_of Nokogiri::HTML::Document
      expect(x.to_s.size).to be > 1000 # TODO use an arbitrary size to hold us til we do better
    end

  end

end
