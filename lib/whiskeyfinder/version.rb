module WhiskeyFinder
  VERSION = "0.1.0"
end

module ClassMethods
  def country_urls
    @american_url = "https://www.masterofmalt.com/country/american-whiskey/"
    @japanese_url = "https://www.masterofmalt.com/country/japanese-whiskey/"
    @irish_url = "https://www.masterofmalt.com/country/irish-whiskey/"
  end
end
