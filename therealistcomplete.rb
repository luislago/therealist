require 'rubygems'
require 'open-uri'

#downloads a "The Realist" issue you choose to your disk

DATA_DIR = "the_realist" 
Dir.mkdir(DATA_DIR) unless File.exists?(DATA_DIR)
BASE_realist_URL = "http://www.ep.tc/realist/" #this is the site where the issues are
puts "issue"
issue = 1
page = BASE_realist_URL + "0" + issue.to_s + "/" #"page" is the webpage where the specified issue is. (ex: issue one is in 
#http://www.ep.tc/realist/01)
ISSUE_DIR = DATA_DIR + "/" + issue.to_s
Dir.mkdir(ISSUE_DIR) unless File.exists?(ISSUE_DIR) #creates folder to store the issue
puts "Creating #{ISSUE_DIR} folder"

number = 1
pagina = page + "0" + number.to_s + ".jpg" # it defines a specific page of the magazine, starting with 1, it directs to 
#the url where the .jpg file where the page scan can be found. the format of the first 9 issues in the site, as well as 
#the format of the first 9 pages of each issue is "00", so, when I'm converting it to string, I need to add a zero

for issue in 1...9 do


		for number in 1...9 do # this loop downloads the first 9 issues of the magazine
			puts "Downloading page #{number}"
		open(pagina) {|f|
   File.open("#{ISSUE_DIR}/#{number}.jpg","wb") do |file|
     file.puts f.read
 end}
 
page = BASE_realist_URL + "0" + issue.to_s + "/"
pagina = page + "0" + number.to_s + ".jpg"
ISSUE_DIR = DATA_DIR + "/" + issue.to_s
Dir.mkdir(ISSUE_DIR) unless File.exists?(ISSUE_DIR) #creates folder to store the issue
end
end
puts "done"