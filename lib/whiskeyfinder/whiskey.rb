class WhiskeyFinder::Whiskey
attr_accessor :name, :price, :distiller, :country, :alcohol_content, :url



def self.find_whiskeys
  #find whiskeys from a certain country
  whiskeys = []

  whiskeys << self.scrape_whiskeys

end


def self.scrape_whiskeys
  #Go to MasterofMalt
  doc = Nokogiri::HTML(open("https://www.masterofmalt.com/country/american-whiskey/"))
  whiskeys = doc.css("div.col-md-12#productBoxWideContainer")
  whiskey_name = whiskeys.first.css('div#ContentPlaceHolder1_ctl00_ProductBoxClass').attr('data-name').value
  whiskey_url = whiskeys.first.css('div#ContentPlaceHolder1_ctl00_ProductBoxClass').attr('data-product-url').value
  whiskey_alc_content = whiskeys.first.css('div#ContentPlaceHolder1_ctl00_VolumeAbv').text
  whiskey_distiller = whiskeys.first.css('a#ContentPlaceHolder1_ctl00_AnchorDistillery').text
  #name = doc.search("h3 a").text
  #distiller = doc.css("a.product-box-wide-distillery.gold").text
  #price = doc.css("div.product-box-wide-price.gold").text
  #alcohol_content = doc.css("div.product-box-wide-volume.gold").text
  binding.pry
end




end
