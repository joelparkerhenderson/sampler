module Services
  class Google < Base

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

  end

end
