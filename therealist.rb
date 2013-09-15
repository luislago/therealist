#uma cena que navegue por todas as páginas do the realist e me faça download de cada imagem 
#/html/body/div[1]/table/tbody/tr/td/blockquote[1]/font/a/img - tag html onde se encontra a imagem
#primeira url de cada issue (capa) é http://www.ep.tc/realist/(número da revista). cada página subsequente é 
#http://www.ep.tc/realist/(número da revista)/(número da página). 
#Usar esta info para designar cada uma das imagens seria obra


require 'rubygems'
require 'open-uri'



DATA_DIR = "the_realist" 
Dir.mkdir(DATA_DIR) unless File.exists?(DATA_DIR)
BASE_realist_URL = "http://www.ep.tc/realist/"
puts "issue"
issue = gets.chomp
page = BASE_realist_URL + issue
ISSUE_DIR = DATA_DIR + "/" + issue
Dir.mkdir(ISSUE_DIR) unless File.exists?(ISSUE_DIR)
pagina = page + "/01"

	
#noko = Nokogiri::HTML(open(page))

# write the HTML for page 1 to disk
#File.open("#{DATA_DIR}/1.html", 'w'){|f| f.write(page.to_html)}


open("#{pagina}.jpg") {|f|
   File.open("#{ISSUE_DIR}/01.jpg","wb") do |file|
     file.puts f.read
   end
}
#src = page.xpath("/html/body/div[1]/table/tbody/tr/td/blockquote[1]/font/a/img").first
#File.open("01.jpg", "w") {|f| f.write((src).read)}


# exemplos do http://ruby.bastardsbook.com/chapters/web-crawling/:
#require 'rubygems'
#require 'nokogiri'
#require 'open-uri'

#DATA_DIR = "data-hold/nobel"
#Dir.mkdir(DATA_DIR) unless File.exists?(DATA_DIR)

#BASE_WIKIPEDIA_URL = "http://en.wikipedia.org"
#LIST_URL = "#{BASE_WIKIPEDIA_URL}/wiki/List_of_Nobel_laureates"

#HEADERS_HASH = {"User-Agent" => "Ruby/#{RUBY_VERSION}"}

#page = Nokogiri::HTML(open(LIST_URL))
#rows = page.css('div.mw-content-ltr table.wikitable tr')

#rows[1..-2].each do |row|
  
  #hrefs = row.css("td a").map{ |a| 
   # a['href'] if a['href'] =~ /^\/wiki\// 
  #}.compact.uniq
  
  #hrefs.each do |href|
    #remote_url = BASE_WIKIPEDIA_URL + href
    #local_fname = "#{DATA_DIR}/#{File.basename(href)}.html"
    #unless File.exists?(local_fname)
     # puts "Fetching #{remote_url}..."
     # begin
       # wiki_content = open(remote_url, HEADERS_HASH).read
      #rescue Exception=>e
       # puts "Error: #{e}"
      #  sleep 5
     # else
       # File.open(local_fname, 'w'){|file| file.write(wiki_content)}
      #  puts "\t...Success, saved to #{local_fname}"
     # ensure
    #    sleep 1.0 + rand
   #   end  # done: begin/rescue
  #  end # done: unless File.exists?
    
 # end # done: hrefs.each
#end # done: rows.each

#require 'rubygems'
#require 'nokogiri'
#require 'open-uri'
#require 'fileutils'
#BASE_URL = 'http://explore.data.gov'
#BASE_DIR = '/catalog/raw/?&page='
#LOCAL_DIR = 'data-hold/datagov-pages'

#FileUtils.makedirs(LOCAL_DIR) unless File.exists?LOCAL_DIR

# get metainfo from first page:
#page = Nokogiri::HTML(open(BASE_URL+BASE_DIR + '1'))

# write the HTML for page 1 to disk
#File.open("#{LOCAL_DIR}/1.html", 'w'){|f| f.write(page.to_html)}

#last_page_number = page.css("/html/body/div[1]/table/tbody/tr/td/blockquote[1]/div[2]/table/tbody/tr/td/div/table[2]/tbody/tr/td/p[1]/font/a")[0]['href'].match(/(\d+)/)[1].to_i

#puts "Iterating from 2 to #{last_page_number}"

#for pg_number in 2..last_page_number do
 # puts "Getting #{pg_number}"
  #File.open("#{LOCAL_DIR}/#{pg_number}.html", 'w') do |f| 
   # f.write( open("#{BASE_URL}#{BASE_DIR}#{pg_number}").read )
  #end
##end