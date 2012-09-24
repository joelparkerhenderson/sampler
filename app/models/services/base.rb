module Services
  class Base
    include HTTParty

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
