require 'rubygems'
require 'mechanize'
#require 'open-uri'

def download_file(url, path)
  data = open(url).read
  tf = File.open(path, "w")
  tf.write(data)
  tf.close
end


FROM = 1 #ENV['from']
TO   = 99 #ENV['to']

#agent = Mechanize.new
#agent.user_agent_alias="Mac FireFox"

base_url = "http://somesite.com/images/map/marker%d.png"

count = 0
done = false

# traverse the pages
for i in (FROM..TO) do

  #file = "#{i}large.jpg"
  #url = base_url + file
  #print "<-- #{i}.jpg :"
  
  url = base_url.gsub(/%d/, i.to_s)
  print "<-- #{url} :"


  begin
    print " ... "
    download_file(url, "marker/#{File.basename url}") 
    count += 1
    print " ... (OK)"
  rescue
    print " ... (FAIL)"
  end
  print "\n"

end


