module Services
  class Yahoo < Base
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

  end

end
