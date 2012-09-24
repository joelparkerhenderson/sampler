module Services
  class Google

    def self.search_url(target)
      "http://www.google.com/search?q=#{URI.encode(target)}"
    end

  end

end
