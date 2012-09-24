module Services
  class Weather < Base

    def self.search(target_text)
      html = self.search_impl(self.search_url(target_text), :at_xpath => self.search_xpath)
    end

    def self.search_url(target_text)
      "http://forecast.weather.gov/zipcity.php?inputstring=#{URI.escape(target_text)}"
    end

    def self.search_xpath
      "//ul[@class='point-forecast-7-day']"
    end

  end

end
