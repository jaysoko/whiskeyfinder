class WhiskeyFinder::Whiskey
attr_accessor :name, :price, :distiller, :country, :alc_content, :url



def self.find_whiskeys
  #find whiskeys from a certain country
  whiskeys = []
  whiskeys << self.scrape_whiskeys

end


def self.scrape_whiskeys
  #Go to MasterofMalt
  whiskey_details = {}
  scraped_whiskeys = []
  doc = Nokogiri::HTML(open("https://www.masterofmalt.com/country/american-whiskey/"))
  whiskeys = doc.css("div.col-md-12#productBoxWideContainer")
  #whiskeys = doc.css("div.col-md-12#productBoxWideContainer.ContentPlaceHolder1_ctl00_ProductBoxClass")
  whiskeys.each {|whiskey|
    whiskey_name = whiskey.css('div#ContentPlaceHolder1_ctl00_ProductBoxClass').attr('data-name').value
    whiskey_url = whiskey.css('div#ContentPlaceHolder1_ctl00_ProductBoxClass').attr('data-product-url').value
    whiskey_alc_content = whiskey.css('div#ContentPlaceHolder1_ctl00_VolumeAbv').text
    whiskey_distiller = whiskey.css('a#ContentPlaceHolder1_ctl00_AnchorDistillery').text
    whiskey_price = whiskey.css('div.product-box-wide-buy-wrapper').first.text.strip
    whiskey_details = {:name => whiskey_name, :price => whiskey_price, :distiller => whiskey_distiller, :alc_content => whiskey_alc_content, :url => whiskey_url}
    scraped_whiskeys << whiskey_details
    binding.pry
  }
  scraped_whiskeys
  #name = doc.search("h3 a").text
  #distiller = doc.css("a.product-box-wide-distillery.gold").text
  #price = doc.css("div.product-box-wide-price.gold").text
  #alcohol_content = doc.css("div.product-box-wide-volume.gold").text
end




end
