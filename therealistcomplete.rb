require 'rubygems'
require 'nokogiri' #gem to parse html
require "open-uri"
DATA_DIR = "The Realist"
Dir.mkdir(DATA_DIR) unless File.exists?(DATA_DIR)
BASE_URL = "http://www.ep.tc/realist/"
page = Nokogiri::HTML(open(BASE_URL))
rows = page.css('div form div select') #option')#[3]["value"]
rows.each do |row|
	hrefs = row.css("option").map{ |a|
	a["value"]}
		hrefs[2..161].each do |href|
		pages = BASE_URL + href + "/"
		ISSUE_DIR = DATA_DIR + "/" + href
		Dir.mkdir(ISSUE_DIR) unless File.exists?(ISSUE_DIR) #creates folder to store the issue on the DATA_DIR and gives it the
#name of the issue
		puts "Creating #{ISSUE_DIR} folder"
                 for number in 1..9
                 # this loop downloads the first 9 pages of the issue
                        pagina = pages + "0" + number.to_s + ".jpg" # this defines a specific page of the magazine, starting with 1,
                        #it directs to the url where the .jpg file with the scan can be found. the format of the first 9 pages
                        #of each issue is "00", so, when I'm converting it to string (with ".to_s", I need to add a zero)
                        puts "Downloading page #{number}"
                		open(pagina) {|f|
   File.open("#{ISSUE_DIR}/#{number}.jpg","wb") do |file|
     file.puts f.read #creates a file with the page number and writes the image there
end }
							




	   

        						
   
   							end
        		end
    	end
