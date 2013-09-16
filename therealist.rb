require 'rubygems'
require 'open-uri'



DATA_DIR = "the_realist" 
Dir.mkdir(DATA_DIR) unless File.exists?(DATA_DIR)
BASE_realist_URL = "http://www.ep.tc/realist/"
puts "issue"
issue = gets.chomp
page = BASE_realist_URL + issue + "/"
ISSUE_DIR = DATA_DIR + "/" + issue
Dir.mkdir(ISSUE_DIR) unless File.exists?(ISSUE_DIR)
puts "Creating #{ISSUE_DIR} folder"
# this is just a place holder until I figure out how to make it automatic
number = 01
pagina = page + "0" + number.to_s + ".jpg"
		for number in 1...10
			puts "Downloading page #{number}"
		open(pagina) {|f|
   File.open("#{ISSUE_DIR}/#{number}.jpg","wb") do |file|
     file.puts f.read
end }


 
   pagina = page + "0" + number.to_s + ".jpg"
	end
	
	number = 10
pagina = page + number.to_s + ".jpg"
	for number in 10...33
		puts "Downloading page #{number}"
		open(pagina) {|f|
   File.open("#{ISSUE_DIR}/#{number}.jpg","wb") do |file|
     file.puts f.read
end }


  
   pagina = page + number.to_s + ".jpg"
      
	end

puts "done"