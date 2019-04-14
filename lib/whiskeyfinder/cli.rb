#!/usr/bin/env ruby
class WhiskeyFinder::CLI
  #include WhiskeyFinder::ClassMethods

  def call
    list_country_options
    country_urls
    menu
  end

  def list_country_options
    puts "International Whiskey Finder"
    puts "1. USA\n2. Japan\n3. Ireland\n4. Type 'exit' to leave"
  end

  def menu
    puts "Enter The Number Of The Country You Wish To Research:"
    input = gets.strip
    counter = 0
    case input
      when "1"
        puts "More Information on American Whiskeys"
        @index_url = @american_url
        @american_list = WhiskeyFinder::Whiskey.find_whiskeys(@index_url, @country="USA")
        @american_list.flatten.map{ |w| puts "#{counter+=1}.\t#{w[:name]}\n\tDistiller: #{w[:distiller]}" }
        puts "Enter The Number Of The Whiskey For More Info:"
        input = gets.strip
      when "2"
        puts "More Info on Japanese Whiskeys"
        @index_url = @japanese_url
        @japanese_list = WhiskeyFinder::Whiskey.find_whiskeys(@index_url, @country="Japan")
        @japanese_list.flatten.map{ |w| puts "#{counter+=1}.\t#{w[:name]}\n\tDistiller: #{w[:distiller]}" }
        puts "Enter The Number Of The Whiskey For More Info:"
        input = gets.strip
      when "3"
        puts "More Info on Irish Whiskeys"
        @index_url = @irish_url
        @irish_list = WhiskeyFinder::Whiskey.find_whiskeys(@index_url, @country="Ireland")
        @irish_list.flatten.map{ |w| puts "#{counter+=1}.\t#{w[:name]}\n\tDistiller: #{w[:distiller]}" }
        more_details_menu
      when "exit"
         goodbye
      end
  end

def more_details_menu
  puts "Enter The Number Of The Whiskey For More Info:"
  input = gets.strip
end

  def goodbye
    puts "Thank You For Playing"
  end

  def country_urls
    @american_url = "https://www.masterofmalt.com/country/american-whiskey/"
    @japanese_url = "https://www.masterofmalt.com/country/japanese-whiskey/"
    @irish_url = "https://www.masterofmalt.com/country/irish-whiskey/"
  end

end
