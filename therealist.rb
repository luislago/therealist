require 'rubygems'
require 'open-uri'



DATA_DIR = "the_realist" 
Dir.mkdir(DATA_DIR) unless File.exists?(DATA_DIR)
BASE_realist_URL = "http://www.ep.tc/realist/"
issue = 01
page = BASE_realist_URL + "0" + issue.to_s + "/"
ISSUE_DIR = DATA_DIR + "/" + issue.to_s
Dir.mkdir(ISSUE_DIR) unless File.exists?(ISSUE_DIR)
# this is just a place holder until I figure out how to make it automatic
number = 01
pagina = page + "0" + number.to_s + ".jpg"
		while issue < 10
		open(pagina) {|f|
   File.open("#{ISSUE_DIR}/#{number}.jpg","wb") do |file|
     file.puts f.read
end }


   number = number + 1
   pagina = page + "0" + number.to_s + ".jpg"

   issue = issue + 1 # this still doesn't work
   page = BASE_realist_URL + "0" + issue.to_s + "/"
	end
puts "done"