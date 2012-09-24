module Services
  class Google

    def self.search_url(target)
      "http://www.google.com/search?q=#{URI.encode(target)}"
    end

    def self.search_xpath
      "//div[@id='search']"
    end

  end

end
