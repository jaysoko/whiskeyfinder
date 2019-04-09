#!/usr/bin/env ruby
class WhiskeyFinder::CLI
  
  
  def call
    list_country_options
    menu
  end
  
  def list_country_options
    puts "International Whiskey Finder"
    puts "1. USA\n2. Japan\n3. Ireland\n4. Type 'exit' to leave"
  end
  
  
  def menu
    puts "Enter The Number Of The Country You Wish To Research:"
    input = gets.strip
    case input
      when "1"
        puts "More Info on American Whiskeys"
      when "2"
        puts "More Info on Japanese Whiskeys"
      when "3"
        puts "More Info on Irish Whiskeys"
      when "exit"
         goodbye
      end
  end
  
  def goodbye
    puts "Thank You For Playing"
  end
end
