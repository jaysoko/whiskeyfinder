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
        @list = WhiskeyFinder::Whiskey.find_whiskeys(@index_url, @country="USA")
        @list.flatten.map{ |w| puts "#{counter+=1}.\t#{w[:name]}\n\tDistiller: #{w[:distiller]}" }
        more_details_menu
      when "2"
        puts "More Information on Japanese Whiskeys"
        @index_url = @japanese_url
        @list = WhiskeyFinder::Whiskey.find_whiskeys(@index_url, @country="Japan")
        @list.flatten.map{ |w| puts "#{counter+=1}.\t#{w[:name]}\n\tDistiller: #{w[:distiller]}" }
        more_details_menu
      when "3"
        puts "More Information on Irish Whiskeys"
        @index_url = @irish_url
        @list = WhiskeyFinder::Whiskey.find_whiskeys(@index_url, @country="Ireland")
        @list.flatten.map{ |w| puts "#{counter+=1}.\t#{w[:name]}\n\tDistiller: #{w[:distiller]}" }
        more_details_menu
      when "exit"
         goodbye
      end
  end

  def more_details_menu
    puts "Enter The Number Of The Whiskey For More Info:"
    input = gets.strip.to_i
    @choice = @list.flatten[input-=1][:name]
    puts "You Chose #{@choice}"
    get_more_details(@choice)
  end

  def get_more_details(choice)
    selection = @list.flatten.select{|x| x[:name]==@choice}
    puts "You've Made A GREAT Selection!\n"
    puts "#{selection.first[:name]} comes to us from #{selection.first[:distiller]}\n"
    puts "#{selection.first[:name]} is #{selection.first[:alc_content]}\n"
    puts "#{selection.first[:name]} goes for a BARGAIN price of: #{selection.first[:price]}\n"
    puts "More Information can be obtained here: #{selection.first[:url]}\n"
    puts "#{selection.first[:text]}"
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
