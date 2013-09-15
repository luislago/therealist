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
# this is just a place holder until I figure out how to make it automatic
number = "01"
pagina1 = page + "/" + number + ".jpg"
number = "02"
pagina2 = page + "/" + number + ".jpg"


open(pagina1) {|f|
   File.open("#{ISSUE_DIR}/#{number}.jpg","wb") do |file|
     file.puts f.read
   end
}

open(pagina2) {|f|
   File.open("#{ISSUE_DIR}/#{number}.jpg","wb") do |file|
     file.puts f.read
   end
}
puts "done"