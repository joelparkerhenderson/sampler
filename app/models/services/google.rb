module Services
  class Google
    include HTTParty

    def self.search(target_text)
      html = self.search_impl(self.search_url(target_text), :at_xpath => self.search_xpath, :remove_xpath => ".//img")
    end

    def self.search_url(target_text)
      target_escape = URI.escape(target_text)
      "http://www.google.com/search?q=#{target_escape}"
    end

    def self.search_xpath
      "//div[@id='search']"
    end

    protected

    def self.search_impl(target_url_string, options = {})
      html =  Nokogiri::HTML(self.get(target_url_string))
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
