require 'rubygems'
require 'open-uri'

#downloads a "The Realist" issue you choose to your disk

DATA_DIR = "the_realist" 
Dir.mkdir(DATA_DIR) unless File.exists?(DATA_DIR)
BASE_realist_URL = "http://www.ep.tc/realist/" #this is the site where the issues are
puts "issue"
issue = gets.chomp
puts "first page"
first_page = gets.chomp
puts "total pages"
total_pages = gets.chomp #I have to set the number of pages of the issue, since it varies from one to the other.

page = BASE_realist_URL + issue + "/" #"page" is the webpage where the specified issue is. (ex: issue one is in 
#http://www.ep.tc/realist/01)
ISSUE_DIR = DATA_DIR + "/" + issue
Dir.mkdir(ISSUE_DIR) unless File.exists?(ISSUE_DIR) #creates folder to store the issue on the DATA_DIR and gives it the 
#name of the issue
puts "Creating #{ISSUE_DIR} folder"
	
	
	for number in first_page.to_i..total_pages.to_i #to_i turns the number I set before from a string to an integer.
pagina = page + number.to_s + ".jpg" #we don't need to add the "0" anymore, since all page number have two digits now.
		puts "Downloading page #{number}"
		open(pagina) {|f|
   File.open("#{ISSUE_DIR}/#{number}.jpg","wb") do |file|
     file.puts f.read
end }


  
      
	end

puts "done"
