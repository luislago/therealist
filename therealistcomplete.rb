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
puts href 
end
end
