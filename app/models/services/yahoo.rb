module Services
  class Yahoo
    include HTTParty

    def self.search(target_text)
      html = self.search_impl(self.search_url(target_text), :at_xpath => self.search_xpath, :remove_xpath => ".//img")
    end

    def self.search_url(target_text)
      "http://search.yahoo.com/search?p=#{URI.escape(target_text)}"
    end

    def self.search_xpath
      "//div[@id='left']"
    end

    protected

    def self.search_impl(target_url_string, options = {})
      Rails.logger.info("search for target_url_string:#{target_url_string}")
      html = self.get(target_url_string)
      Rails.logger.info("search got html size:#{html ? html.size : nil}")
      Rails.logger.info html
      html =  Nokogiri::HTML(html)
      if options[:at_xpath]
        html = html.at_xpath(options[:at_xpath])
      end
      if options[:remove_xpath]
        html.search(options[:remove_xpath]).remove
      end
      html
    end

  end

end
