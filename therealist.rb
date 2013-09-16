require 'rubygems'
require 'open-uri'

#downloads a "The Realist" issue you choose to your disk

DATA_DIR = "the_realist" 
Dir.mkdir(DATA_DIR) unless File.exists?(DATA_DIR)
BASE_realist_URL = "http://www.ep.tc/realist/" #this is the site where the issues are
puts "issue"
issue = gets.chomp
page = BASE_realist_URL + issue + "/" #"page" is the webpage where the specified issue is. (ex: issue one is in 
#http://www.ep.tc/realist/01)
ISSUE_DIR = DATA_DIR + "/" + issue
Dir.mkdir(ISSUE_DIR) unless File.exists?(ISSUE_DIR) #creates folder to store the issue
puts "Creating #{ISSUE_DIR} folder"

number = 1
pagina = page + "0" + number.to_s + ".jpg" # it defines a specific page of the magazine, starting with 1, it directs to 
#the url where the .jpg file where the page scan can be found. the format of the first 9 issues in the site, as well as 
#the format of the first 9 pages of each issue is "00", so, when I'm converting it to string, I need to add a zero

		for number in 1...9 # this loop downloads the first 9 issues of the magazine
			puts "Downloading page #{number}"
		open(pagina) {|f|
   File.open("#{ISSUE_DIR}/#{number}.jpg","wb") do |file|
     file.puts f.read
end }


 
   pagina = page + "0" + number.to_s + ".jpg"
	end
	
	number = 10
pagina = page + number.to_s + ".jpg" #we don't need to add the "0" anymore, since all page number have two digits now.
	for number in 10...33 #still a place holder, need to find how to stop the loop when there are no more .jpgs to 
	#download.
		puts "Downloading page #{number}"
		open(pagina) {|f|
   File.open("#{ISSUE_DIR}/#{number}.jpg","wb") do |file|
     file.puts f.read
end }


  
   pagina = page + number.to_s + ".jpg"
      
	end

puts "done"
