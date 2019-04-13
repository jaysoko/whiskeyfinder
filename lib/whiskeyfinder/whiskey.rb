class WhiskeyFinder::Whiskey
attr_accessor :name, :price, :distiller, :country, :alc_content, :url



def self.find_whiskeys
  #find whiskeys from a certain country
  whiskeys = []
  whiskeys << self.scrape_whiskeys

end


def self.scrape_whiskeys
  #Go to MasterofMalt
  whiskeys = []
  doc = Nokogiri::HTML(open("https://www.masterofmalt.com/country/american-whiskey/"))
  products = doc.css('div.boxBgr.product-box-wide.h-gutter.js-product-box-wide')
      products.each do |whiskey|
        whiskeys << {
          name: whiskey.search("h3 a").text,
          url: whiskey.search("h3 a").attr('href').value,
          alc_content: whiskey.css("div.product-box-wide-volume.gold").text,
          price: whiskey.css("div.product-box-wide-price.gold").text,
          distiller: whiskey.css("a.product-box-wide-distillery.gold").text }
      end
  whiskeys
  #Crib Notes
  #name = doc.search("h3 a").text
  #distiller = doc.css("a.product-box-wide-distillery.gold").text
  #price = doc.css("div.product-box-wide-price.gold").text
  #alcohol_content = doc.css("div.product-box-wide-volume.gold").text
end

end
